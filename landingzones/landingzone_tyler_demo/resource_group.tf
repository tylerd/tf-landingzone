
resource "azurerm_resource_group" "rg" {
  name      = "rg-${local.prefix}-demo"
  location =  local.global_settings.location_map.region1
}