output "address" {
  description = "Stage database address"
  value       = module.db.address
}

output "port" {
  description = "Stage database port"
  value       = module.db.port
}
