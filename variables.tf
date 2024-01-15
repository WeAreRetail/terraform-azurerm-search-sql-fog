variable "region_main" {
  type        = string
  description = "The tag region value"
  default     = "MAIN"
}

variable "region_dr" {
  type        = string
  description = "The tag region value"
  default     = "DISASTER_RECOVERY"
}

variable "project" {
  type        = string
  description = "The tag project value"
}

variable "environment" {
  type        = string
  description = "The environment"
}
