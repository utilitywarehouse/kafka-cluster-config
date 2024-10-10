variable "produce_topics" {
  type        = list(string)
  description = "The topics that the app produces to"
  default     = []
}

variable "consume_topics" {
  type        = list(string)
  description = "The topics that the app consumes."
  default     = []
}

variable "consume_groups" {
  type        = list(string)
  description = "The Kafka consumer groups that the app uses to consume."
  default     = []
}

variable "cert_common_name" {
  type        = string
  description = "The principal or user/group for which the ACL is being created."

  validation {
    condition     = length(var.cert_common_name) <= 64
    error_message = "Certificate common name (CN) has max length of 64 chars. https://datatracker.ietf.org/doc/html/rfc5280"
  }
}

# ACL
variable "acl_host" {
  type        = string
  description = "The host from which the principal is allowed to perform operations. Set to '*' to allow any host."
  default     = "*"
}
