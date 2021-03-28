terraform {
  required_version = ">0.14"
}

locals {
  default_tags = {
    Customer      = var.customer
    Owner         = var.owner
    Env           = var.env
    Email         = var.email
    Repo          = var.repo
    Tool          = var.tool
    ResourceGroup = var.resource_group
    Module        = var.module
    Deployment    = var.deployment
  }

  tags = merge(local.default_tags, var.tags)
}