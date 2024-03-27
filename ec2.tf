# Create EC2 Instance in Public Subnet
resource "aws_instance" "Bastion-host" {
  provider = aws.dev
  ami           = var.bastion_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_A.id
  vpc_security_group_ids = [aws_security_group.SSH-From-RSM.id]
  associate_public_ip_address = true

  tags = {
    Name = "Bastion-host"
  }
 /*
  lifecycle {
    prevent_destroy = true
  }
  */
}

# Create EC2 Instance in Private Subnet

resource "aws_instance" "private_instance" {
  provider = aws.dev
  ami           = var.bastion_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet_A.id
  vpc_security_group_ids = [aws_security_group.SSH-From-RSM.id]

  tags = {
    Name = "Private-Ec2"
  }

 /*
  lifecycle {
    prevent_destroy = true
  }
  */
}

