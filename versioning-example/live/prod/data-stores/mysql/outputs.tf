output "address" {
  description = "Prod database address"
  value       = module.db.address
}

output "port" {
  description = "Prod database port"
  value       = module.db.port
}
