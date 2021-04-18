terraform {
  required_version = ">0.15"
}

locals {

  default_tags = {
    Customer   = var.customer
    Env        = var.env
    Deployment = var.deployment

    Owner = var.owner
    Email = var.email

    ResourceGroup = var.resource_group

    Module = var.module
    Branch = data.git_repository.current_repo.branch
    Repo   = data.git_repository.current_repo.url
    Tool   = var.tool
  }

  tags = merge(local.default_tags, var.tags)
}