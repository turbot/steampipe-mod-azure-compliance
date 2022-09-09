## Description

Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app.

The TLS mutual authentication technique in enterprise environments ensures the authenticity of clients to the server. If incoming client certificates are enabled, then only an authenticated client who has valid certificates can access the app.

## Remediation

### From Azure Portal

1. Login to Azure Portal using https://portal.azure.com
2. Go to `App Services`
3. Click on each App
4. Under the Settings section, Click on `Configuration`, then `General settings`
5. Set the option `Client certificate mode` located under Incoming client certificates is set to `Require`


### From Azure CLI

To set Incoming client certificates value for an existing app, run the following command:

```bash
az webapp update --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> -- set clientCertEnabled=true
```

### Default Value

By default, incoming client certificates will be disabled when a new app is created using the command-line tool or Azure Portal console.