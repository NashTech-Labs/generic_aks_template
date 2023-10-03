# Output the AKS cluster name
output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

# Output the AKS cluster resource group name
output "aks_resource_group_name" {
  value = module.aks.aks_resource_group_name
}

# Output the AKS cluster DNS prefix
output "aks_dns_prefix" {
  value = module.aks.aks_dns_prefix
}

output "kubeconfig" {
  value     = module.aks.kubeconfig
  sensitive = true
}
# # Output the user name of the virtual machine
output "admin_username" {
  value = var.private_cluster_enabled ? module.vm.vm_admin_name : null
}


# Output the public IP address of the virtual machine
output "virtual_machine_public_ip" {
  # value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
  value = var.private_cluster_enabled ? module.vm.vm_public_id : null
}
