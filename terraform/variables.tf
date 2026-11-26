variable "region" {
  description = "AWS region to build everything in"
  type        = string
  default     = "eu-west-2"
}

variable "project" {
  description = "Name used to label all resources"
  type        = string
  default     = "cloud-web-app"
}

variable "image_tag" {
  description = "Which version of the Docker image to run"
  type        = string
}

variable "desired_count" {
  description = "How many copies of the container to run"
  type        = number
  default     = 2
}