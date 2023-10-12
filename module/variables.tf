##############################
#      Common Name           #
##############################

variable "name" {
  description = "Common Name for all the resources"
  type        = string
}

########################################
# Virtual Network and Subnet variables #
########################################

variable "vnet_name" {
  description = "VNET name"
  type        = string
}

variable "vnet_rg_name" {
  description = "VNET resource group name"
  type        = string
}

#####################
# Bastion variables #
#####################

variable "location" {
  description = "Resource Group location for the Bastion and related resources"
  type        = string
}
