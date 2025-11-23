# Terraform Azure Core Modules

A library of foundational, reusable Terraform modules for Azure infrastructure with sensible defaults.

## Overview

`terraform-azure-core-modules` provides a comprehensive suite of vanilla, production-ready Terraform modules designed 
to deploy key Azure resources. These modules are built to be easy to adopt, composable, and standardized—serving as the 
core building blocks for your Azure architecture.

Use this repository when you want consistent infrastructure patterns across your Azure environments, while retaining 
flexibility via module inputs and overrides.

## Key Features

- Modular, reusable Terraform modules covering a wide range of Azure services.
- Sensible defaults out of the box—get started with minimal configuration.
- Designed for Terraform version ≥ `0.15`.
- Clear separation of concerns: each module manages a specific service (e.g., VM, VNet, Storage, AKS).
- Enterprise-ready: Standard tagging, naming convention, resource groups, etc.
- Upstream modules you can consume into higher-level “construct” or “solution” repos.

- **Terraform version** >= `0.15`

## Best Practices
- Use this repo as the core module library. For your actual environments/projects, create separate repos that consume 
these modules (with minimal changes to module code).
- Use versioned tags/releases of this library to ensure stability and controlled upgrades.
- Encourage teams to follow standardized variable names and outputs across modules for consistency.
- Run module-level testing (e.g., via terraform validate, terraform fmt, tflint) before releasing new versions.

## Modules

- [aks](terraform/aks)
- [aks-nodepool](terraform/aks-nodepool)  
- [app-service-plan](terraform/app-service-plan)
- [application-gateway](terraform/application-gateway)
- [application-insights](terraform/application-insights)  
- [cache-redis](terraform/cache-redis)
- [cloud-init-fileshare](terraform/cloud-init-fileshare)
- [cloud-init-microservice](terraform/cloud-init-microservice)
- [cloud-init-microservice-datadisk](terraform/cloud-init-microservice-datadisk)
- [cloud-init-microservice-fileshare](terraform/cloud-init-microservice-fileshare)
- [cloud-init-microservice-fileshare-elk](terraform/cloud-init-microservice-fileshare-elk)
- [cloud-init-microservice-fileshare-jenkins-master](terraform/cloud-init-microservice-fileshare-jenkins-master)
- [cloud-init-microservice-fileshare-sonarqube](terraform/cloud-init-microservice-fileshare-sonarqube)
- [container-registry](terraform/container-registry)
- [cosmosdb-account](terraform/cosmosdb-account)  
- [database-server-mysql](terraform/database-server-mysql)
- [database-server-postgresql](terraform/database-server-postgresql)
- [dns-zone-private](terraform/dns-zone-private)
- [dns-zone-public](terraform/dns-zone-public)
- [function-app](terraform/function-app)  
- [key-vault](terraform/key-vault)  
- [key-vault-cert-generate](terraform/key-vault-cert-generate)
- [linux-virtual-machine](terraform/linux-virtual-machine)
- [linux-virtual-machine-scaleset](terraform/linux-virtual-machine-scaleset)
- [logic-app](terraform/logic-app)
- [logic-app-alert-notifier-slack](terraform/logic-app-alert-notifier-slack)  
- [monitor-autoscale-setting](terraform/monitor-autoscale-setting)
- [network-gateway](terraform/nat-gateway)
- [network-security-group](terraform/network-security-group)
- [network-security-group-rules](terraform/network-security-group-rules)  
- [network-watcher-flow-log](terraform/network-watcher-flow-log)
- [resource-group](terraform/resource-group)
- [route-table](terraform/route-table)
- [storage-account](terraform/storage-account)
- [subnet](terraform/subnet)
- [subnet-nsg](terraform/subnet-nsg)
- [subnet-rt-nsg](terraform/subnet-rt-nsg)
- [tags](terraform/tags)
- [virtual-machine-linux](terraform/virtual-machine-linux)
- [virtual-machine-scaleset-linux](terraform/virtual-machine-scaleset-linux)
- [virtual-network](terraform/virtual-network)
- [virtual-network-gateway](terraform/virtual-network-gateway)
- [virtual-network-peering](terraform/virtual-network-peering)
  
## Development
To manage the Terraform version, [tfenv](https://github.com/tfutils/tfenv) is being used.  

## Licencing & Maintainer

License: GPL-3.0.\
Maintainer: Mishal Shah –- _mishalshah92@gmail.com_

## Releases

Click [here](RELEASES.md) to view Releases!!!
