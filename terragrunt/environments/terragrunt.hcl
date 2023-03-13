generate "versions" {
  path      = "versions_override.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
      required_providers {
        azurerm = {
          source = "hashicorp/azurerm"
          version = "~>2.0"
        }
      }
    }
    provider "azurerm" {
      features {}
      subscription_id = "dcdfe38c-2ad1-4c84-b066-5ed998685a77"
    }
  EOF
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    resource_group_name  = "demo-rg"
    storage_account_name = "demostoragerb"
    container_name       = "env"
    key            = "${path_relative_to_include()}/terraform.tfstate"
  }
}

