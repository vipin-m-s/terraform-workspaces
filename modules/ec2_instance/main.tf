
provider "aws" {
    region = "ap-south-2"
}

variable "ami" {
    description = "AM"
}

variable "instance_type" {
    description = "Instance type"
}

resource "aws_instance" "server" {
    ami = var.ami
    instance_type = var.instance_type
}