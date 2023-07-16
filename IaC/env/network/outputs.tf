output "vpc_id" {
    description = "value"
    value = module.network.vpc_id
}

output "public_subnet_id" {
    description = "value"
    value = module.network.public_subnet_id
}

output "private_subnet_id" {
    description = "value"
    value = module.network.private_subnet_id
}

