plugin "terraform" {
  enabled = true
  preset  = "all"
}

rule "terraform_standard_module_structure" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}

config {
  module = true
}