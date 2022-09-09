## Description

Azure Active Directory Conditional Access allows an organization to configure Named locations and configure whether those locations are trusted or untrusted. These settings provide organizations the means to specify Geographical locations for use in conditional access policies, or define actual IP addresses and IP ranges and whether or not those IP addresses and/or ranges are trusted by the organization.

Defining trusted source IP addresses or ranges helps organizations create and enforce Conditional Access policies around those trusted or untrusted IP addresses and ranges. Users authenticating from trusted IP addresses and/or ranges may have less access restrictions or access requirements when compared to users that try to authenticate to Azure Active Directory from untrusted locations or untrusted source IP addresses/ranges.

## Remediation

### From Azure Portal

1. Navigate to the `Azure AD Conditional Access` Blade
2. Click on the `Named locations` blade
3. Within the `Named locations` blade, click on `IP ranges location`
4. Enter a name for this location setting in the `Name` text box
5. Click on the + sign
6. Add an IP Address Range in CIDR notation inside the text box that appears
7. Click on the `Add` button
8. Repeat steps 5 through 7 for each IP Range that needs to be added
9. If the information entered are trusted ranges, select the `Mark as trusted location` check box
10. Once finished, click on `Create`

### From PowerShell

Create a new trusted IP-based Named location policy

```bash
[System.Collections.Generic.List`1[Microsoft.Open.MSGraph.Model.IpRange]]$ipR
anges = @()
$ipRanges.Add("<first IP range in CIDR notation>")
$ipRanges.Add("<second IP range in CIDR notation>")
$ipRanges.Add("<third IP range in CIDR notation>")
New-AzureADMSNamedLocationPolicy -OdataType
"#microsoft.graph.ipNamedLocation" -DisplayNam
```

Set an existing IP-based Named location policy to trusted

```bash
Set-AzureADMSNamedLocationPolicy -PolicyId "<ID of the policy>" -OdataType "#microsoft.graph.ipNamedLocation" -IsTrusted $true
```

### Default Value

By default, no locations are configured under the Named locations blade within the Azure AD Conditional Access blade.