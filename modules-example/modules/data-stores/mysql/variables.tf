variable "db_password" {
  description = "Password for the database"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_user" {
  description = "User name"
  type        = string
  default     = "admin"
}

variable "identifier_prefix" {
  description = "Unique identifier prefix"
  type        = string
}
