# tflint configuration file that applies to all MSK team modules

plugin "terraform" {
  enabled = true
  preset  = "all"
}

plugin "uw-kafka-config" {
  enabled = true

  version = "1.0.0"
  source  = "github.com/utilitywarehouse/tflint-ruleset-kafka-config"
}

# I think it's too late for this and wouldn't make sense for our modules
rule "terraform_standard_module_structure" {
  enabled = false
}

# Include module calls
config {
  call_module_type = "all"
}
