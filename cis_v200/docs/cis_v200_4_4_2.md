## Description

Ensure `TLS version` on `MySQL flexible` servers is set to the default value.

TLS connectivity helps to provide a new layer of security by connecting database server to client applications using Transport Layer Security (TLS). Enforcing TLS connections between database server and client applications helps protect against "man in the middle" attacks by encrypting the data stream between the server and application.

## Remediation

### From Azure Portal

1. Login to Azure Portal using [https://portal.azure.com](https://portal.azure.com)
2. Go to `Azure Database for MySQL flexible servers`
3. For each database, click on `Server parameters` under `Settings`
4. In the search box, type in `tls_version`
5. Click on the VALUE dropdown, and ensure only `TLSV1.2` is selected for `tls_version`

### From Azure CLI

Use the below command to set MYSQL flexible databases to used version 1.2 for the `tls_version` parameter.

```bash
az mysql flexible-server parameter set --name tls_version --resource- group <resourceGroupName> --server-name <serverName> --value TLSV1.2
```

### Default Value

By default, TLS is set to v1.2 for MySQL Flexible servers.
