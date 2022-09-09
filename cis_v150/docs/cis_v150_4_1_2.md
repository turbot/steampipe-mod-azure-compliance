## Description

Ensure that no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP).

Azure SQL Server includes a firewall to block access to unauthorized connections. More granular IP addresses can be defined by referencing the range of addresses available from specific datacenters.

By default, for a SQL server, a Firewall exists with StartIp of 0.0.0.0 and EndIP of 0.0.0.0 allowing access to all the Azure services.

Additionally, a custom rule can be set up with StartIp of 0.0.0.0 and EndIP of 255.255.255.255 allowing access from ANY IP over the Internet.

In order to reduce the potential attack surface for a SQL server, firewall rules should be defined with more granular IP addresses by referencing the range of addresses available from specific datacenters.

## Remediation

### From Azure Console

1. Go to `SQL servers`
2. For each SQL server
3. Click on `Firewall and virtual networks`
4. Set `Allow Azure services and resources to access this server` to `No`
5. Set firewall rules to limit access to only authorized connections

### From Azure CLI

Disable default firewall rule Allow access to Azure services:

```bash
az sql server firewall-rule delete --resource-group <resource group> --server
<sql server name> --name "AllowAllWindowsAzureIps"
```

Remove a custom firewall rule:

```bash
az sql server firewall-rule delete --resource-group <resource group> --server
<sql server name> --name <firewall rule name>
```

Create a firewall rule:

```bash
az sql server firewall-rule create --resource-group <resource group> --server
<sql server name> --name <firewal lrule name> --start-ip-address "<IP Address
other than 0.0.0.0>" --end-ip-address "<IP Address other than 0.0.0.0 or
255.255.255.255>"
```

Update a firewall rule:

```bash
az sql server firewall-rule update --resource-group <resource group> --server
<sql server name> --name <firewal lrule name> --start-ip-address "<IP Address
other than 0.0.0.0>" --end-ip-address "<IP Address other than 0.0.0.0 or
255.255.255.255>"
```

### From PowerShell

Disable Default Firewall Rule Allow access to Azure services :

```bash
Remove-AzSqlServerFirewallRule -FirewallRuleName "AllowAllWindowsAzureIps" -
ResourceGroupName <resource group name> -ServerName <server name>
```

Remove a custom Firewall rule:

```bash
Remove-AzSqlServerFirewallRule -FirewallRuleName "<firewall rule name>" -
ResourceGroupName <resource group name> -ServerName <server name>
```

Set the appropriate firewall rules:

```bash
Set-AzSqlServerFirewallRule -ResourceGroupName <resource group name> -
ServerName <server name> -FirewallRuleName "<firewall rule name>" -
StartIpAddress "<IP Address other than 0.0.0.0>" -EndIpAddress "<IP Address
other than 0.0.0.0 or 255.255.255.255>"
```

### Default Value

By default, setting `Allow access to Azure Services` is set to `ON` allowing access to all Windows Azure IP ranges.