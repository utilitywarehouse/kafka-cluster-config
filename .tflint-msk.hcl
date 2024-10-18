# tflint configuration file that applies to all MSK team modules

plugin "terraform" {
  enabled = true
  preset  = "all"
}

plugin "uw-kafka-config" {
  enabled = true

  version = "1.2.0"
  source  = "github.com/utilitywarehouse/tflint-ruleset-kafka-config"
}

# I think it's too late for this and wouldn't make sense for our modules
rule "terraform_standard_module_structure" {
  enabled = false
}

rule "msk_topic_name" {
  enabled = true
  team_aliases = {
    iam = ["auth", "auth-customer"]
    customer-billing = ["bex"]
  }
}

# Disable this rule until we fix the current issues
rule "msk_app_topics" {
  enabled = true
}

# Include module calls
config {
  call_module_type = "all"
}
