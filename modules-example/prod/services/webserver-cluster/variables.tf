variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "terraform-demo-2022-03-26"
}

variable "db_remote_state_key" {
  description = "The name of the key in the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "prod/data-stores/mysql/terraform.tfstate"
}


variable "db_remote_state_region" {
  description = "Region for db's remote state S3 bucket"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "The name to use to namespace all the resources in the cluster"
  type        = string
  default     = "prod-webservers"
}
