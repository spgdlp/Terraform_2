variable "iam_user_name_prefix" {
  type = string  #any, number, bool, list, map, set, object, object
  default = "my_iam_user_from_main" # Superpuesto por el fichero tfvars
}

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
  name =  "${var.iam_user_name_prefix}_${count.index}"
}

