provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-demo-2022-03-26"
    key    = "stage/services/webserver-cluster/terraform.tfstate"
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

  instance_image = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.nano"
  min_size       = 2
  max_size       = 3
}
