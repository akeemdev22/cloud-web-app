variable "name" {
  description = "Name prefix for the network resources"
  type        = string
}

variable "cidr" {
  description = "IP range for the whole VPC"
  type        = string
  default     = "10.0.0.0/16"
}