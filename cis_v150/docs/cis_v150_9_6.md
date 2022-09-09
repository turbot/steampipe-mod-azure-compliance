## Description

Periodically newer versions are released for PHP software either due to security flaws or to include additional functionality. Using the latest PHP version for web apps is recommended in order to take advantage of security fixes, if any, and/or additional functionalities of the newer version.

Newer versions may contain security enhancements and additional functionality. Using the latest software version is recommended in order to take advantage of enhancements and new capabilities. With each software installation, organizations need to determine if a given update meets their requirements. They must also verify the compatibility and support provided for any additional software against the update revision that is selected.

## Remediation

### From Azure Portal

1. From Azure Home open the Portal Menu in the top left
2. Go to `App Services`
3. Click on each App
4. Under `Settings` section, click on `Configuration`
5. Click on the `General settings` pane, ensure that for a `Stack` of `PHP` the `Major Version` and `Minor Version` reflect the latest stable and supported release.

**Note:** No action is required If PHP version is set to Off or is set with an empty value as PHP is not used by your web app.

### From Azure CLI

To set latest PHP version for an existing app, run the following command:

```bash
az webapp list-runtimes | grep php az webapp config set -g <resource group name> -n <app name> --php-version <"x.y" latest stable/supported version>
```

### From Powershell

To set latest PHP version for an existing app, run the following command:

```bash
Set-AzWebApp -ResourceGroupName <resource group name> -Name <app name> - phpVersion <'x.y' latest stable/supported version>
```

### Default Value

By default, the version of PHP is whatever was selected upon App creation.
