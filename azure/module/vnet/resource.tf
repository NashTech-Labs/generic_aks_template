
# Create a virtual network
resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_1
  address_space       = var.vnet_1_address_space
  location            = var.rg_location
  resource_group_name = var.rg_name
}

# Create a subnet within the virtual network
resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_1
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.subnet_1_address_prefix

}

resource "azurerm_subnet" "vm_subnet" {
  count                = var.private_cluster_enabled ? 1 : 0
  name                 = var.subnet_2
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.subnet_2_address_prefix

}
