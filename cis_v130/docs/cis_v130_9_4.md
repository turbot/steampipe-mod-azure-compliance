## Description

Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app. The TLS mutual authentication technique in enterprise environments ensures the authenticity of clients to the server. If incoming client certificates are enabled, then only an authenticated client who has valid certificates can access the app.

As default, incoming client certificates is set to *Ignore*.

## Remediation

### From Console

1. Login to Azure Portal and go to `App Services`.
2. Click on each App.
3. Under `Settings` section, click on `Configuration`.
4. Go to `General settings` tab.
5. Set the option `Client certificate mode` located under `Incoming client certificates` is set to `Require`.

### From Command Line

To set Incoming client certificates value for an existing app:

```bash
az webapp update --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> -- set clientCertEnabled=true
```
