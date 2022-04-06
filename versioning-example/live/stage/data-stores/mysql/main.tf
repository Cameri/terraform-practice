provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-demo-2022-03-26"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

module "db" {
  source = "github.com/Cameri/terraform-practice//modules/data-stores/mysql?ref=v0.0.1"

  identifier_prefix = "stage-master-db"
  db_name           = "staging"
  db_password       = var.db_password
}
