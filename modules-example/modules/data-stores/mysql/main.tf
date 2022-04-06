resource "aws_db_instance" "example" {
  identifier_prefix   = var.identifier_prefix
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  db_name             = var.db_name
  username            = var.db_user
  skip_final_snapshot = true

  # How should we set the password?
  password = var.db_password
}
