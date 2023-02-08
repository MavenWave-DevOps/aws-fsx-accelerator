# ---- mtc networking/main.tf -----


data "aws_availability_zones" "available" {}

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "random_shuffle" "az_list" {
  input        = data.aws_availability_zones.available.names
  result_count = var.max_subnets
}
resource "aws_vpc" "fsx_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "fsx_vpc-${random_integer.random.id}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "fsx_private_subnet" {
  count             = var.private_sn_count
  vpc_id            = aws_vpc.fsx_vpc.id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = random_shuffle.az_list.result[count.index]

  tags = {
    Name = "fsx_private_${count.index + 1}"
  }
}

resource "aws_nat_gateway" "fsx_nat_gw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.fsx_private_subnet[0].id

  tags = {
    Name = "fsx_natgw"
  }
}

resource "aws_default_route_table" "fsx_private_rt" {
  default_route_table_id = aws_vpc.fsx_vpc.default_route_table_id

  tags = {
    Name = "fsx_private"
  }
}

resource "aws_security_group" "fsx_sg" {
  for_each    = var.security_groups
  name        = each.value.name
  description = each.value.description
  vpc_id      = aws_vpc.fsx_vpc.id

  # NetApp Security group
  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      from_port   = ingress.value.from
      to_port     = ingress.value.to
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}