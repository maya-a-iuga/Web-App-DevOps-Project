terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azure"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "549b492c-2de8-4e83-84fe-d55e63b066bf"
  client_secret   = "KHL8Q~a954lzhfeG.Qqut942LABjem28J_cMwdgY"
  subscription_id = "8ab233ac-c619-4888-bf7a-422ea867b8d8"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}
