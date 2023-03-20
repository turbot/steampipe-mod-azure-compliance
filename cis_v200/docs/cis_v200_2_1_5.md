## Description

Turning on Microsoft Defender for SQL servers on machines enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud.

Enabling Microsoft Defender for SQL servers on machines allows for greater defense- in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC).

## Remediation

### From Azure Portal

1. Go to `Microsoft Defender for Cloud`
2. Select `Environment Settings` blade.
3. Click on the subscription name.
4. Select the `Defender plans` blade.
5. Click `Select types` > in the row for `Databases`.
6. Set the radio button next to `SQL servers on machines` to `On`.
7. Select `Continue`.
8. Select `Save`.

### From Azure CLI

Run the following command:

```bash
az security pricing create -n SqlServerVirtualMachines --tier 'standard'
```

### From Powershell

Run the following command:

```bash
Set-AzSecurityPricing -Name 'SqlServerVirtualMachines' -PricingTier 'Standard'
```

### Default Value

By default, Microsoft Defender plan is off.
