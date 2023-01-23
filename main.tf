#variable "iam_user_name_prefix" {
#  type = string  #any, number, bool, list, map, set, object, object
#  default = "my_iam_user_from_main" # Superpuesto por el fichero tfvars
#}

variable "names" {
  default = {
    ranga : "Netherlands",
    tom: "USA",
   jane: "Germany"
  }
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

#resource "aws_iam_user" "my_iam_users" {
#  count = 3
#  name =  "${var.iam_user_name_prefix}_${count.index}"
# }


# resource "aws_iam_user" "my_iam_users" {
#   #count = length(var.names)
#   #name =  var.names[count.index]
# 
#   for_each = toset(var.names)
#   name = each.value   #asigna el nombre al index.id de cada usuario 
# }

resource "aws_iam_user" "my_iam_users" {
  for_each = var.names
  name = each.key
  tag = {
    country: each.value
  }
}