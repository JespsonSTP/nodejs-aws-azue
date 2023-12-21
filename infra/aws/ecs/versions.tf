terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
  backend "s3" {
    bucket          = "impresso-ecs-infra"
    key             = "impresso-ecs-infra/terraform.tfstate"
    dynamodb_table  = "impresso-ecs-infra-table"
    encrypt         = true
    region          = "us-east-1"
  }
}