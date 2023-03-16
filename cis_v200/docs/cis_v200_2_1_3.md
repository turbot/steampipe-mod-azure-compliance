## Description

Turning on Microsoft Defender for Databases enables threat detection for the instances running your database software. This provides threat intelligence, anomaly detection, and behavior analytics in the Azure Microsoft Defender for Cloud. Instead of being enabled on services like Platform as a Service (PaaS), this implementation will run within your instances as Infrastructure as a Service (IaaS) on the Operating Systems hosting your databases.

Enabling Microsoft Defender for Azure SQL Databases allows your organization more granular control of the infrastructure running your database software. Instead of waiting on Microsoft release updates or other similar processes, you can manage them yourself. Threat detection is provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`.
2. Select `Environment Settings`.
3. Click on the subscription name.
4. Select `Defender plans`.
5. Set `Databases Status` to `On`.
6. Select `Save`.

Review the chosen pricing tier. For the `Azure Databases` resource review the different plan information and choose one that fits the needs of your organization.

### From Azure CLI

Run the following command:

```bash
az security pricing create -n 'SqlServers' --tier 'Standard'
az security pricing create -n 'SqlServerVirtualMachines' --tier 'Standard'
az security pricing create -n 'OpenSourceRelationalDatabases' --tier 'Standard'
az security pricing create -n 'CosmosDbs' --tier 'Standard'
```

### From Azure PowerShell

Run the following command:

```bash
Set-AzSecurityPricing -Name 'SqlServers' -PricingTier 'Standard'
Set-AzSecurityPricing -Name 'SqlServerVirtualMachines' -PricingTier 'Standard'
Set-AzSecurityPricing -Name 'OpenSourceRelationalDatabases' -PricingTier 'Standard'
Set-AzSecurityPricing -Name 'CosmosDbs' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender Plans are off.
