
output "vm_admin_name" {
  value = var.private_cluster_enabled ? azurerm_linux_virtual_machine.my_vm[0].admin_username  : null

}
output "vm_public_id" {
  value = var.private_cluster_enabled ? azurerm_linux_virtual_machine.my_vm[0].public_ip_address : null
}