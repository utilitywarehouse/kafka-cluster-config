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
}

# ACL
variable "acl_host" {
  type        = string
  description = "The host from which the principal is allowed to perform operations. Set to '*' to allow any host."
  default     = "*"
}

# QUOTA
variable "consumer_byte_rate" {
  type = number
  // See https://docs.confluent.io/kafka/design/quotas.html#enforcement
  description = "The maximum number of bytes per second consumers with the specified user can consume across topics per broker."
  default     = 5242880 # Limit producing to 5 MB/s

  validation {
    condition     = var.consumer_byte_rate > 0 && var.consumer_byte_rate <= 10485760
    error_message = "Producer byte rate must be between 0 bytes per second and 10 MB per second (inclusive)."
  }
}

variable "producer_byte_rate" {
  type = number
  # See https://docs.confluent.io/kafka/design/quotas.html#enforcement
  description = "The maximum number of bytes per second producers with the specified user can produce across topics per broker."
  default     = 5242880 # Limit producing to 5 MB/s

  validation {
    condition     = var.producer_byte_rate > 0 && var.producer_byte_rate <= 10485760
    error_message = "Producer byte rate must be between 0 bytes per second and 10 MB per second (inclusive)."
  }
}

variable "request_percentage" {
  type        = number
  description = "The percentage of requests the app connecting with the specified user is allowed to make."
  # Allow 100% of CPU. More on this here: https://docs.confluent.io/kafka/design/quotas.html#request-rate-quotas
  default = 100

  validation {
    condition     = var.request_percentage >= 0 && var.request_percentage <= 100
    error_message = "Request percentage must be between 0 and 100 (inclusive)."
  }
}
