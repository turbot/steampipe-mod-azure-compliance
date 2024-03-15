## Description

Public IP Addresses provide tenant accounts with Internet connectivity for resources contained within the tenant. During the creation of certain resources in Azure, a Public IP Address may be created. All Public IP Addresses within the tenant should be periodically reviewed for accuracy and necessity.

Public IP Addresses allocated to the tenant should be periodically reviewed for necessity. Public IP Addresses that are not intentionally assigned and controlled present a publicly facing vector for threat actors and significant risk to the tenant.

## Remediation

Remediation will vary significantly depending on your organization's security requirements for the resources attached to each individual Public IP address.

### Default Value

During Virtual Machine and Application creation, a setting may create and attach a public IP.
