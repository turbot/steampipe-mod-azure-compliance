## Description

It is recommended to enable RBAC on all Azure Kubernetes Services Instances. Azure Kubernetes Services has the capability to integrate Azure Active Directory users and groups into Kubernetes RBAC controls within the AKS Kubernetes API Server. This should be utilized to enable granular access to Kubernetes resources within the AKS clusters supporting RBAC controls not just of the overarching AKS instance but also the individual resources managed within Kubernetes.

## Remediation

As default, RBAC is enabled. This setting cannot be changed after AKS deployment, cluster will require recreation. For more information refer [Use Azure RBAC for Kubernetes](https://docs.microsoft.com/en-us/azure/aks/manage-azure-rbac)
