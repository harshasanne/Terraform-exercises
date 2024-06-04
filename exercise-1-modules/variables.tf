variable "subnets" {
  description = "List of subnets to create"
  type        = list(object({
    name = string
    cidr = string
  }))
  default = [
    { name = "subnet1", cidr = "10.0.1.0/24" },
    { name = "subnet2", cidr = "10.0.2.0/24" }
  ]
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}
