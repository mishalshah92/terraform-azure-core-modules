# Azure Cloud Init Microservice

Terraform modules to generate the cloud-init file for deploying container at start.

## Development

```hcl-terraform

module "cloud-init-microservice" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/cloud-init-microservice"

  azure_identity_login   = true
  acr_login              = true
  docker_login           = false
  login_server           = "customeracr.azure.io"
  docker_compose_content = file("docker-compose.yml")
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)