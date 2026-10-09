# Module plumbing only - the mirror-maker config itself lives in ../mirror-maker.tf, and the
# files alongside this one hold the consumer groups of one mirrored topic each.
#
# Terraform resolves provider requirements per module, so this has to name the kafka provider's
# source address even though the provider configuration is inherited from the parent.
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kafka = {
      source  = "Mongey/kafka"
      version = ">= 0.7.0"
    }
  }
}

variable "mirror_maker_principal" {
  description = "Principal of the cert the energy-platform mirror-maker authenticates with."
  type        = string
}
