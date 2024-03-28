resource "aws_instance" "imported-instance" {
 ami           = "ami-0c101f26f147fa7fd"
 instance_type = "t2.micro"

 tags = {
   "Name1": "import"
   "Name": "import-test"
 }
/*
   lifecycle {
    ignore_changes = [
      tags
    ]
  }
  */
}

resource "aws_instance" "imported-instance1" {
 provider = aws.awstest
 ami           = "ami-06e46074ae430fba6"
 instance_type = "t2.micro"

 tags = {
   "Name1": "import1"
   "Name": "import-test2"
 }
/*
   lifecycle {
    ignore_changes = [
      tags
    ]
  }
  */
}
