output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_default_sg" {
  value = module.vpc.default_sg
}

output "vpc_subnet_ids" {
  value = module.subnets.subnet_ids
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}
