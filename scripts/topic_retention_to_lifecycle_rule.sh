#!/usr/bin/env bash

root_cluster=$1

TMP=$(mktemp)

# Extract topic=days
find ${root_cluster} -name "*.tf" | xargs awk '
  /resource "kafka_topic"/ { t=$3; gsub(/"/,"",t) }
  /"retention.ms"/ {
    ms=$3; gsub(/[^0-9]/,"",ms)
    d=int(ms/86400000)
    if(d>0) print t "=" d
  }
' > "$TMP"

# Merge by retention and print lifecycle rules
awk -F= '
{
  days=$2
  topics[days] = topics[days] ? topics[days]" "$1 : $1
}
END {
  # Collect and sort retention days ascending
  n=0
  for(d in topics) days_arr[++n]=d
  for(i=1;i<=n;i++){
    for(j=i+1;j<=n;j++){
      if(days_arr[i]+0>days_arr[j]+0){tmp=days_arr[i];days_arr[i]=days_arr[j];days_arr[j]=tmp}
    }
  }

  for(i=1;i<=n;i++){
    d=days_arr[i]
    split(topics[d], arr, " ")
    asort(arr)
    printf "lifecycle_rule { id = \"retention_%d\"; enabled = true;\n", d
    printf "  expiration { days = %d }\n", d
    for(j=1;j<=length(arr);j++){
      s3_path=arr[j]; gsub("_",".",s3_path)
      printf "  filter { prefix = \"msk-backup-parquet/%s/\" }\n", s3_path
    }
    print "}"
  }
}' "$TMP"

rm "$TMP"
