# Azure Hub-and-Spoke Infrastructure (IaC)

## Project Overview
This project demonstrates an enterprise-grade network topology in Microsoft Azure. It uses a **Hub-and-Spoke** model to centralize shared resources and isolate application workloads.

## Technical Features
* **Infrastructure as Code:** Managed via Terraform (HCL).
* **Network Topology:** 1 Hub VNet, 1 Spoke VNet.
* **Connectivity:** Bi-directional VNet Peering.
* **Security:** Isolated address spaces (10.0.0.0/16 and 10.1.0.0/16).

## Tools Used
* **Cloud:** Microsoft Azure
* **IaC:** Terraform
* **CLI:** Azure CLI
