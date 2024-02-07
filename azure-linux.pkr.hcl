source "azure-arm" "ubuntu" {
  client_id                         = "$CLIENTID"
  client_secret                     = "$CLIENTSECRET"
  tenant_id                         = "$TENANTID"
  subscription_id                   = "$SUBSCRIPTIONID"

  managed_image_resource_group_name = "abp1rgsobr1crpacker001"
  managed_image_name                = "prd-packer-ubuntu-tf-tg-azcli-{{timestamp}}"

  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts"

  azure_tags = {
    "context"                          = "<name>" #### alterar #####
    "critical_for_business_continuity" = "cr"
    "environment"                      = "prd1"
    "management_group"                 = "ab"
  }

  location = "Brazil South"
  vm_size  = "Standard_D2s_v3"

}

build {
  name = "ubuntu"
  sources = [
    "source.azure-arm.ubuntu",
  ]

  provisioner "shell" {
    script = "scripts/config.sh"
  }

  post-processor "manifest" {}

}