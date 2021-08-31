variable iac_cidr_block {
    type = string
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}

resource "aws_vpc" "tf_environment_iac" {
    cidr_block           = var.iac_cidr_block
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        "terraform"   : "true"
        "environment" : "prod"
        "project"     : "IaC"
    }
}