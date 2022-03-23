resource "azurerm_role_assignment" "role_net" {
  scope                = data.azurerm_subnet.k8s_subnet.id
  role_definition_name = "Network Contributor"
  principal_id         = azuread_service_principal.spr.object_id

  depends_on = [azurerm_virtual_network.vnet, azuread_service_principal.spr]
}

resource "azurerm_role_assignment" "role_ope" {
  scope                = azurerm_user_assigned_identity.id.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azuread_service_principal.spr.object_id
  depends_on           = [azurerm_user_assigned_identity.id, azuread_service_principal.spr]
}

resource "azurerm_role_assignment" "role_cont" {
  scope                = azurerm_application_gateway.agw.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
  depends_on           = [azurerm_user_assigned_identity.id, azurerm_application_gateway.agw]
}

resource "azurerm_role_assignment" "role_mio_useridentity_agw" {
  scope                = azurerm_application_gateway.agw.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
  depends_on           = [azurerm_user_assigned_identity.id, azuread_service_principal.spr]
}

resource "azurerm_role_assignment" "role_mio_useridentity_useridentity" {
  scope                = azurerm_user_assigned_identity.id.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
  depends_on           = [azurerm_user_assigned_identity.id, azuread_service_principal.spr]
}

resource "azurerm_role_assignment" "role_mio_useridentity_agwrg" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
  depends_on           = [azurerm_user_assigned_identity.id, azuread_service_principal.spr]
}

resource "azurerm_role_assignment" "role_net_useridentity" {
  scope                = data.azurerm_subnet.k8s_subnet.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
  depends_on = [azurerm_virtual_network.vnet, azuread_service_principal.spr]
}

resource "azurerm_role_assignment" "role_read" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.id.principal_id
  depends_on           = [azurerm_user_assigned_identity.id, azurerm_application_gateway.agw]
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azuread_service_principal.spr.object_id
  skip_service_principal_aad_check = true
  depends_on                       = [azuread_service_principal.spr, azurerm_container_registry.acr]
}
#Teste--------------------------------------------------------------------------------------------------------------------------
resource "azurerm_role_assignment" "role_arquitetos" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Owner"
  principal_id         = "326ac7b0-e2a0-4f1c-95d7-2bc25cb3dae6"

  depends_on = [azurerm_virtual_network.vnet, azuread_service_principal.spr]
}
#--------------------------------------------------------------------------------------------------------------------------