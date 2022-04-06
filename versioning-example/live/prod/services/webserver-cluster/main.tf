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
  source = "github.com/Cameri/terraform-practice//versioning-example/modules/services/webserver-cluster?ref=v0.0.1"

  cluster_name           = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key
  db_remote_state_region = var.db_remote_state_region

  instance_image = "ami-0a313d6098716f372"
  instance_type  = "t2.micro"
  min_size       = 1
  max_size       = 2
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  autoscaling_group_name = module.webserver_cluster.asg_name
  scheduled_action_name  = "scale-out-during-business-hours"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  recurrence             = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  autoscaling_group_name = module.webserver_cluster.asg_name
  scheduled_action_name  = "scale-in-at-night"
  min_size               = 1
  max_size               = 2
  desired_capacity       = 1
  recurrence             = "0 17 * * *"
}
