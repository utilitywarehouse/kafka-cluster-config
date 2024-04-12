plugin "terraform" {
  enabled = true
  preset  = "all"
}

# I think it's too late for this and wouldn't make sense for our modules
rule "terraform_standard_module_structure" {
  enabled = false
}

# Include module calls
config {
  module = true
}
