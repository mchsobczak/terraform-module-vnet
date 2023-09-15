module "naming" {
  source = "Azure/naming/azurerm"
  prefix = [var.project_prefix]
  suffix = [var.environment, "tf"]
}

locals {
  virtual_network_name = module.naming.virtual_network.name
  network_security_group_name = module.naming.network_security_group.name
}