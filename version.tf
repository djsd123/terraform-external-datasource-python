terraform {
  required_providers {
    external = {
      source = "hashicorp/external"
      version = "~> 2.2"
    }
  }

  backend "s3" {
    acl     = "private"
    bucket  = "kel-pulumi-inf-state"
    encrypt = "true"
    key     = "terraform/terraform-external-datasource-python"
    region  = "eu-west-1"
    #    kms_key_id = ""
  }

  required_version = ">= 1.2.0, < 2.0.0"
}
