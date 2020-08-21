#Azure Generic vNet Module
data azurerm_resource_group "vnet" {
  name = var.resource_group_name
}

resource azurerm_virtual_network "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet.name
  location            = data.azurerm_resource_group.vnet.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = data.azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}

data "azurerm_subnet" "import" {
  for_each             = var.nsg_ids
  name                 = each.key
  resource_group_name  = data.azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  depends_on = [azurerm_subnet.subnet]
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  for_each                  = var.nsg_ids
  subnet_id                 = data.azurerm_subnet.import[each.key].id
  network_security_group_id = each.value
}

resource "azurerm_subnet_route_table_association" "vnet" {
  for_each       = var.route_tables_ids
  route_table_id = each.value
  subnet_id      = data.azurerm_subnet.import[each.key].id
}