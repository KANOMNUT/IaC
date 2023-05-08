terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.37.2"
    }
  }
}

resource "azuread_application" "example" {
  display_name = "terraform-app"
}

resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
  depends_on = [
    azuread_application.example
  ]
}

resource "time_rotating" "example" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "example" {
  service_principal_id = azuread_service_principal.example.object_id
  rotate_when_changed = {
    rotation = time_rotating.example.id
  }
  depends_on = [
    azuread_service_principal.example
  ]
}