provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-demo-2022-03-26"
    key    = "prod/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
  db_remote_state_region = var.db_remote_state_region

  instance_image = "ami-0a313d6098716f372"
  instance_type  = "t2.micro"
  min_size       = 1
  max_size       = 2
}
