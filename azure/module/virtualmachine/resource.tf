
# Create NIC
resource "azurerm_network_interface" "my_vm_nic" {
  count               = var.private_cluster_enabled ? 1 : 0
  name                = var.network_nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  depends_on          = [azurerm_network_security_group.my_nsg, azurerm_public_ip.my_vm_public_ip]

  ip_configuration {
    name                          = var.network_ip_config
    subnet_id                     = var.vnet_subnet_id_2
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.my_vm_public_ip[0].id
  }
}

# Create public IPs
resource "azurerm_public_ip" "my_vm_public_ip" {
  count               = var.private_cluster_enabled ? 1 : 0
  name                = var.public_ip_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = var.public_ip_address_allocation
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "my_nsg" {
  count               = var.private_cluster_enabled ? 1 : 0
  name                = var.network_security_group_name
   location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {

    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    direction                  = var.security_rule_direction
    access                     = var.security_rule_access
    protocol                   = var.security_rule_protocol
    source_port_range          = var.security_rule_source_port_range
    destination_port_range     = var.security_rule_destination_port_range
    source_address_prefix      = var.security_rule_source_address_prefix
    destination_address_prefix = var.security_rule_destination_address_prefix
  }
}



resource "azurerm_network_interface_security_group_association" "my_nsg_Association" {
  count                     = var.private_cluster_enabled ? 1 : 0
  network_interface_id      = azurerm_network_interface.my_vm_nic[count.index].id
  network_security_group_id = azurerm_network_security_group.my_nsg[count.index].id
}




# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_vm" {
  count                 = var.private_cluster_enabled ? 1 : 0
  name                  = var.vm_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  network_interface_ids = [azurerm_network_interface.my_vm_nic[count.index].id]
  size                  = var.vm_size
  depends_on            = [azurerm_network_interface.my_vm_nic]
  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }

  computer_name                   = var.computer_name
  admin_username                  = var.admin_username
  admin_password                  = var.pass
  disable_password_authentication = var.disable_password_authentication



  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = azurerm_linux_virtual_machine.my_vm[count.index].public_ip_address
      user     = var.admin_username
      password = var.pass # Path to your private key file
    }

    inline = [
      "sudo apt-get update",
      "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash",
      # "sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y",
      # "sudo mkdir -p /etc/apt/keyrings",
      # "curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null",
      # "sudo chmod go+r /etc/apt/keyrings/microsoft.gpg",
      # "AZ_REPO=$(lsb_release -cs)",
      # "echo 'deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main' | sudo tee /etc/apt/sources.list.d/azure-cli.list",
      "sudo apt-get update",
      "sudo apt-get install azure-cli -y",
      "sudo snap install kubectl --classic",
    ]
  }

}