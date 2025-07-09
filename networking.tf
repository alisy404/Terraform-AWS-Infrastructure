#The cloud provider
provider "aws" {
  region = "us-east-1"
}

# The tags used in each resource
locals {
  common_tags = {
    ManagedBy  = "Terraform"
    Project    = "06-resources"
    CostCenter = "12345"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "06-resources"
  })
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = merge(local.common_tags, {
    Name = "06-resources-subnet-public"
  })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id


  tags = merge(local.common_tags, {
    Name = "06-resources-internet-gateway"
  })
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }


  tags = merge(local.common_tags, {
    Name = "06-resources-route-table"
  })
}

#This is used to associate any resource not just the mentioned below. This are just as we require.
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.main.id
}



