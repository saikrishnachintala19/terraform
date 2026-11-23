terraform {                         # Starts Terraform's own settings.
  required_providers {              # Lists the provider plugins Terraform needs.
    aws = {                         # Gives this provider the local name "aws".
      source  = "hashicorp/aws"     # Finds the AWS plugin published by HashiCorp.
      version = "6.70.0"            # Uses version 6.70.0 of that plugin.
    }                               # Ends the "aws" provider requirement.
  }                                 # Ends the required_providers block. 
  backend "s3" {
   
  } 
}                                 # Ends the terraform block.

provider "aws" {                    # Starts configuration for the "aws" provider.
  # Configuration options           # Comment only; Terraform ignores it.
  region = "us-east-1"              # Uses the US East (N. Virginia) AWS region.
}                                   # Ends the provider configuration.