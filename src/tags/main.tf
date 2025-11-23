locals {

  default_tags = {
    Customer   = var.customer
    Env        = var.env
    Deployment = var.deployment

    Owner = var.owner
    Email = var.email

    ResourceGroup = var.resource_group

    Module = var.module
    Repo   = var.repo
    Tool   = var.tool
  }

  tags = merge(local.default_tags, var.tags)
}