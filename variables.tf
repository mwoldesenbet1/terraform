variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_block_B" {
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_block_B" {
  default = "10.0.4.0/24"
}

variable "private_subnet_cidr_block" {
  default = "10.0.3.0/24"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "bastion_ami" {
  default = "ami-080e1f13689e07408"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_cidr_blocks" {
  default = ["66.98.96.0/20", "137.83.228.0/23", "208.127.108.0/23", "208.127.153.0/24"]
}

variable "root_ou_id" {
  type    = string
  default = "r-vbtt"
}

variable "aws_access_key" {

 type = string
 default = ""
}

variable "aws_secret_key" {
 type = string
 default = ""
}
