
provider "aws" {
  region = "us-west-2"
}

#Centraliza o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-igti-talita"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-west-2"
  }
}