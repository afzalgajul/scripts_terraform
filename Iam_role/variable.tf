terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAR3FZUPQCWMAUCQWL"
  secret_key = "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"
}
