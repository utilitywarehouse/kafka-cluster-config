plugin "terraform" {
  enabled = true
  preset  = "all"
}

# I think it's too late for this and wouldn't make sense for our modules
rule "terraform_standard_module_structure" {
  enabled = false
}

# Suppressing this until we fix it
rule "terraform_required_version" {
  enabled = false
}

# Include module calls
config {
  module = true
}
