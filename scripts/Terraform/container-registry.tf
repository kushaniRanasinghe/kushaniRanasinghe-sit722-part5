#
# Creates a container registry on Azure so that we can publish our Docker images.
#
resource "azurerm_container_registry" "container_registry" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.flixtube.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

# Output the name of the Azure Container Registry
output "registry_name" {
  value       = azurerm_container_registry.container_registry.name
  description = "The name of the Azure Container Registry"
}
