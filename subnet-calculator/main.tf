locals {
    snet_size = ceil(log(length({ for sub in var.subnets: sub.name => sub}), 2))
    output = { for idx, sub in var.subnets: sub.name => cidrsubnet(var.cidr, local.snet_size, idx) }
}

variable "cidr" {
    type = string
    default = "10.0.0.0/20"
}

variable "subnets" {
  type = list(object({
    name = string
  }))
}

output "output" {
    value = local.output
}