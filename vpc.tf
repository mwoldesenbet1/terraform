# Create VPC
resource "aws_vpc" "terraform-vpc" {
  provider = aws.dev
  cidr_block          = var.vpc_cidr_block
  instance_tenancy    = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-vpc"
  }

  lifecycle {
    
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "Terraform-IGW" {
  provider = aws.dev
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "Terraform-IGW"
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet_A" {
  provider          = aws.dev
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "public_subnet_A"
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet_A" {
  provider = aws.dev
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "Private_subnet_A"
  }
}


# Create Additional Public Subnet
resource "aws_subnet" "public_subnet_B" {
  provider          = aws.dev
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.public_subnet_cidr_block_B  # Define this variable in your configuration
  availability_zone = "${var.aws_region}b"  # Change the availability zone to "b"

  tags = {
    Name = "public_subnet_B"
  }
}

# Create Additional Private Subnet
resource "aws_subnet" "private_subnet_B" {
  provider = aws.dev
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.private_subnet_cidr_block_B  # Define this variable in your configuration
  availability_zone = "${var.aws_region}b"  # Change the availability zone to "b"

  tags = {
    Name = "Private_subnet_B"
  }
}


# Create Route Table for Public Subnet
resource "aws_route_table" "public_RTB" {
  provider = aws.dev
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraform-IGW.id
  }

  tags = {
    Name = "Public_RTB"
  }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_subnet_association" {
  provider = aws.dev
  subnet_id      = aws_subnet.public_subnet_A.id
  route_table_id = aws_route_table.public_RTB.id
}

# Create NAT Gateway
resource "aws_nat_gateway" "terraform_Nat_Gateway" {
  provider = aws.dev
  allocation_id = aws_eip.terraform_eip.id
  subnet_id     = aws_subnet.public_subnet_A.id

  tags = {
    Name = "Terraform_Nat_Gateway"
  }
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "terraform_eip" {
  provider = aws.dev
  domain = "vpc"

  tags = {
    Name = "Terraform_eip"
  }
}

# Create Route Table for Private Subnet
resource "aws_route_table" "private_RTB" {
  provider = aws.dev
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform_Nat_Gateway.id
  }

  tags = {
    Name = "Private_RTB"
  }
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_subnet_association" {
  provider = aws.dev
  subnet_id      = aws_subnet.private_subnet_A.id
  route_table_id = aws_route_table.private_RTB.id
}

# Create Security Group for EC2 Instances
resource "aws_security_group" "SSH-From-RSM" {
  provider = aws.dev
  vpc_id = aws_vpc.terraform-vpc.id

  # Define ingress rules (inbound)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  # Define egress rules (outbound)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH-From-RSM"
  }
}
