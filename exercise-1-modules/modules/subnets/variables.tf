variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to create"
  type        = list(object({
    name = string
    cidr = string
  }))
}
