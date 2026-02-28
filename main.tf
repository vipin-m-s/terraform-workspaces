provider "aws" {
    region = "ap-south-2"
}

variable "ami" {
    default = "ami-00e42015cc6980619"
}

variable "instance_type" {
    description = "Instance type"
    type = map(string) 

    default = {
        "dev" = "t3.micro"
        "stage" = "t3.small"
        "prod" = "t3.medium"
    }

}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami = var.ami 
    instance_type = lookup(var.instance_type, terraform.workspace, "t3.micro")
}