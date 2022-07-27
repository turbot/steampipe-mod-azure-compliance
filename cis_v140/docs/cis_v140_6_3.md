## Description

Ensure that no SQL Databases allow ingress from `0.0.0.0/0` (ANY IP).

SQL Server includes a firewall to block access to unauthorized connections. More granular IP addresses can be defined by referencing the range of addresses available from specific datacenters.

By default, for a SQL server, a Firewall exists with `StartIp` of `0.0.0.0` and `EndIP` of `0.0.0.0` allowing access to all the Azure services.

Additionally, a custom rule can be set up with `StartIp` of `0.0.0.0` and `EndIP` of `255.255.255.255` allowing access from ANY IP over the Internet.

In order to reduce the potential attack surface for a SQL server, firewall rules should be defined with more granular IP addresses by referencing the range of addresses available from specific datacenters.

By default, setting Allow access to Azure Services is set to ON allowing access to all Windows Azure IP ranges.

## Remediation

### From Console

1. Login to Azure console, go to SQL servers
2. For each SQL server
3. Click on `Firewall / Virtual Networks` under security section from side bar
4. Set `Allow access to Azure services` to **OFF**
5. Set firewall rules to limit access to only authorized connections
