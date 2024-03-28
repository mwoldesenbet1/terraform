resource "aws_instance" "main-account-ec2" {
 ami           = "ami-0c101f26f147fa7fd"
 instance_type = "t2.micro"

 tags = {
   "Name": "main-account-ec2"
 }
/*
   lifecycle {
    ignore_changes = [
      tags
    ]
  }
  */
}

resource "aws_instance" "aws-test-ec2" {
 provider = aws.awstest
 ami           = "ami-06e46074ae430fba6"
 instance_type = "t2.small"

 tags = {
   "Name": "awstest-ec2"
 }
/*
   lifecycle {
    ignore_changes = [
      tags
    ]
  }
  */
}
