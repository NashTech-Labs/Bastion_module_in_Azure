locals {
  rg_name       = "bastion-${var.name}-rg"
  bastion_pip_name = "bastion-${var.name}-pip"
  bastion_host_ip_configuration_name = "bastion-${var.name}-ip-configuration"
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
}

resource "azurerm_resource_group" "bastion_rg" {
  name     = local.rg_name
  location = var.location
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = local.bastion_pip_name
  location            = azurerm_resource_group.bastion_rg.location
  resource_group_name = azurerm_resource_group.bastion_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = var.name
  location            = azurerm_resource_group.bastion_rg.location
  resource_group_name = azurerm_resource_group.bastion_rg.name
  sku                 = "Standard"
  tunneling_enabled   = true

  ip_configuration {
    name                 = local.bastion_host_ip_configuration_name
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}
