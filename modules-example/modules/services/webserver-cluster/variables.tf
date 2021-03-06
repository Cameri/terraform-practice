variable "server_port" {
  description = "server port"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "Name for cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "Name of S3 bucket for db's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "Path for db's remote state in S3 bucket"
  type        = string
}

variable "db_remote_state_region" {
  description = "Region for db's remote state S3 bucket"
  type        = string
}

variable "instance_image" {
  description = "AMI for EC2 Instances to run"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}
