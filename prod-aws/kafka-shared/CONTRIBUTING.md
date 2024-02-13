# Contributing guidelines

Please follow these guidelines for the resources:
1. topic and consumer groups naming: prefix the names with the name of your team. Examples: **bex.internal.bill_fulfilled**, **bex.bills-total-api-reader** where **bex** is the name of the team.
   This will make it easier to define access in the kafka-ui
2. consider the number of partitions for a topic. In Amazon MSK the total number of partitions influences the cost. See https://wiki.uw.systems/posts/amazon-msk-managed-kafka-9kjst9t5#h97za-msk
