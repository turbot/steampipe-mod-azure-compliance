## Description

Periodically newer versions are released for PHP software either due to security flaws or to include additional functionality. Using the latest PHP version for web apps is recommended in order to take advantage of security fixes, if any, and/or additional functionalities of the newer version.

Newer versions may contain security enhancements and additional functionality. With each software installation, organizations need to determine if a given update meets their requirements and also verify the compatibility and support provided for any additional software against the update revision that is selected.

## Remediation

### From Console

Perform the following action to check latest version installed:

1. Login to Azure Portal and go to `App Services`.
2. Click on each App.
3. Under `Settings` section, click on `Configuration`.
4. Go to `General settings` tab.
5. Under `Stack settings`, ensure `PHP version` is set to latest version.

**Note** No action is required If Stack is not using PHP, as it is not used by your web app.

Perform the following action to install latest version:

1. Login to Azure Portal and go to `App Services`.
2. Click on each App.
3. Under `Settings` section, click on `Configuration`.
4. Go to `General settings` tab.
5. Under `Stack settings`, set `PHP version` to the latest version.
6. Click `Save`.

### From Command Line

To see the list of supported runtimes:

```bash
az webapp list-runtimes | grep php
```

To set latest PHP version for an existing app, run the following command:

```bash
az webapp config set --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> --php-version <VERSION>
```
