output "subnet_1_id" {
  value = azurerm_subnet.aks_subnet.id
}
output "subnet_id_2" {
  value = var.private_cluster_enabled ? azurerm_subnet.vm_subnet[0].id :null
}
output "vnet_name" {
  value = azurerm_virtual_network.aks_vnet.name
}
output "subnet_name" {
  value = azurerm_subnet.aks_subnet.name
}