terraform {
  cloud {
    organization = "tf-class-september-20"

    workspaces {
      name = "infra-billing"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "billing_alert" {
  source = "binbashar/cost-billing-alarm/aws"

  aws_env = "ziyotek"
  monthly_billing_threshold = 15
  currency = "USD"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = module.billing_alert.sns_topic_arns[0]
  protocol  = "email"
  endpoint  = "zebo.alieva.0622@gmail.com"
}