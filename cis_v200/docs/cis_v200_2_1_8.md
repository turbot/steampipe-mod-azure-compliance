## Description

Turning on Microsoft Defender for Containers enables threat detection for Container Registries including Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud.

Enabling Microsoft Defender for Container Registries allows for greater defense-in- depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`.
2. Select `Environment Settings`.
3. Click on the subscription name.
4. Select `Defender plans`.
5. Set `Status` to `On` for `Containers`.
6. Click `Save`.

### From Azure CLI

(**Note:** 'ContainerRegistry' has been deprecated and is replaced by 'Containers')
Use the below command to enable Standard pricing tier for Containers.

```bash
az security pricing create -n 'Containers' --tier 'standard'
```

### From Powershell

(**Note:** 'ContainerRegistry' has been deprecated and is replaced by 'Containers')
Use the below command to enable Standard pricing tier for Containers.

```bash
Set-AzSecurityPricing -Name 'Containers' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender plan is off.
