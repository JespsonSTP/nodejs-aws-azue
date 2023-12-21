terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
  #backend "local" {}
  backend "s3" {
    bucket          = "impresso-network-infra"
    key             = "impresso-network-infra/terraform.tfstate"
    dynamodb_table  = "impresso-network-infra-table"
    encrypt         = true
    region          = "us-east-1"
  }
}