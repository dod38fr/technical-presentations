
data "aws_vpc" "default" {
  default = true
}

module "subnet_addrs" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = "10.0.0.0/16"

  networks = [
    {
      name     = "foo"
      new_bits = 8
    },
    {
      name     = "bar"
      new_bits = 8
    },
  ]
}

resource "aws_vpc" "example" {
  cidr_block = module.subnet_addrs.base_cidr_block
}

resource "aws_subnet" "main" {
  for_each   = module.subnet_addrs.network_cidr_blocks
  vpc_id     = aws_vpc.example.id
  cidr_block = each.value
}
