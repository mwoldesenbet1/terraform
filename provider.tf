#provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "mek-terra-backend-state-file"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state"
  }
}

provider "aws" {
  alias   = "main"
  region  = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
# profile = "tera"
}

provider "aws" {
  alias   = "dev"
  region  = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
 # profile = "tera"

  assume_role {
    role_arn = "arn:aws:iam::471112561699:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias   = "awstest"
  region  = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  #profile = "tera"

  assume_role {
    role_arn = "arn:aws:iam::628789204422:role/switch-role"
  }
}


