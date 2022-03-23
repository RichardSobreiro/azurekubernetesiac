data "azurerm_client_config" "default" {}

data "azurerm_key_vault" "kv" {
  name                = "${var.key_vault_name}"
  resource_group_name = "${var.key_vault_resource_group_name}"
}

resource "azurerm_key_vault_access_policy" "policy_current" {
  key_vault_id        = data.azurerm_key_vault.kv.id
  tenant_id           = data.azurerm_client_config.default.tenant_id
  object_id           = data.azurerm_client_config.default.object_id

  key_permissions = [
    "get"
  ]

  secret_permissions = [
    "get"
  ]

  certificate_permissions = [
    "get"
  ]

}

resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id        = data.azurerm_key_vault.kv.id
  tenant_id           = data.azurerm_client_config.default.tenant_id
  object_id           = azuread_service_principal.spr.object_id

  key_permissions = [
    "get"
  ]

  secret_permissions = [
    "get"
  ]

  certificate_permissions = [
    "get"
  ]

  depends_on = [azuread_service_principal.spr] 
}

resource "azurerm_key_vault_access_policy" "policy_aks" {
  key_vault_id        = data.azurerm_key_vault.kv.id
  tenant_id           = data.azurerm_client_config.default.tenant_id
  object_id           = azurerm_user_assigned_identity.id.principal_id

  key_permissions = [
    "get"
  ]

  secret_permissions = [
    "get"
  ]

  certificate_permissions = [
    "get"
  ]

  depends_on = [azurerm_user_assigned_identity.id, azuread_service_principal.spr] 
}

data "azurerm_key_vault_secret" "secret_ssh" {
  name         = "aks-ssh-public-key"
  key_vault_id = data.azurerm_key_vault.kv.id

  depends_on = [azurerm_key_vault_access_policy.policy_current] 
}

data "azurerm_key_vault_secret" "ssl_password" {
  name         = "passwildcardsupermixcombr"
  key_vault_id = data.azurerm_key_vault.kv.id

  depends_on = [azurerm_key_vault_access_policy.policy_current]
}

data "azurerm_key_vault_secret" "ssl_certificate" {
  name         = "sslwildcardsobreirodevcombr"
  key_vault_id = data.azurerm_key_vault.kv.id

  depends_on = [azurerm_key_vault_access_policy.policy_current]
}