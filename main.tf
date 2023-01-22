terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.27.0"
    }
  }
}
provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_user" "my_iam_users" {
  count = 3
  name =  "my-iam-user-${count.index}"
}

