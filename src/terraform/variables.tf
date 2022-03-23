# Principal
variable "prefixo" {
  description = "Prefixo utilizado nos nomes dos recursos."
}

variable "sufixo" {
  description = "Sufixo utilizado nos nomes dos recursos."
}

# Azure AD Application
variable "azuread_application"{
  description = "Nome da aplicação no Azure AD."
  default = "AKS-NPE"
}

# Resource Group
variable "location" {
  description = "Região de criação do cluster."
}

# Network
variable "virtual_network_address_prefix" {
  description = "Prefixo de endereços da rede virtual."
  default     = "15.0.0.0/8"
}

variable "aks_subnet_name" {
  description = "Nome da subnet AKS."
  default     = "k8s-subnet"
}

variable "aks_subnet_address_prefix" {
  description = "Endereços IP do Servidor de Containers DNS."
  default     = "15.1.0.0/16"
}

variable "app_gateway_subnet_name" {
  description = "Nome da subnet Application Gateway."
  default     = "agw-subnet"
}

variable "app_gateway_subnet_address_prefix" {
  description = "Endereços IP do Servidor de Containers DNS."
  default     = "15.0.0.0/16"
}

variable "public_ip_allocation" {
  description = "Modo do IP público."
  default     = "Static"
}

variable "public_ip_sku" {
  description = "SKU do IP público."
  default     = "Standard"
}

# Key Vault
variable "key_vault_resource_group_name" {
  description = "Nome do grupo de recurso do Key Vault."
  default = "ric-brso-all-rg-vault"
}

variable "key_vault_name" {
  description = "Nome do Key Vault."
  default = "ric-brso-all-kv-vault"
}

variable "key_vault_ssl_cert_name" {
  description = "Nome do certificado SSL."
  default = "sslwildcardsobreirodevcombr"
}

# Gateway
variable "app_gateway_sku" {
  description = "SKU do Application Gateway."
  default = "Standard_v2"
}

# Container Registry
variable "container_registry_sku" {
  description = "SKU do repositório de containers."
  default = "Basic"
}

# Kubernetes
variable "aks_dns_prefix" {
  description = "Prefixo DNS para uso do AKS"
  default     = "aks"
}

variable "vm_user_name" {
  description = "Usuário das VMs AKS"
  default     = "ric-k8s-admin"
}

variable "aks_agent_count" {
  description = "Número de nós para o cluster."
  default     = 1
}

variable "aks_agent_vm_size" {
  description = "Tamanho da VM de nó."
  default     = "Standard_D2_v3"
}

variable "max_pods_default_node" {
  description = "Limite máximo de pods por node no cluster."
  default     = "250"
}

variable "aks_agent_os_disk_size" {
  description = "Tamanho de disco (GB) do nó da VM."
  default     = 64
}

variable "aks_kubernetes_version" {
  description = "Versão do Kubernetes."
  default = "1.21.0"
}

variable "aks_service_cidr" {
  description = "Um intervalo de IP da notação CIDR a partir do qual atribuir IPs de cluster de serviço."
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "Endereço IP do servidor DNS de contêineres."
  default     = "10.0.0.10"
}

variable "aks_docker_bridge_cidr" {
  description = "Um IP de notação CIDR para ponte do Docker."
  default     = "172.17.0.1/16"
}

# Tags
variable "tags" {
  type = map

  default = {
    criação = "terraform"
    desenvolvimento = "sim"
    teste = "sim"
    qualityassurance = "sim"
    produção = "não"
  }
}