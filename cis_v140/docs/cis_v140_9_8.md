## Description

Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the newer version.

Newer versions may contain security enhancements and additional functionality. With each software installation, organizations need to determine if a given update meets their requirements and also verify the compatibility and support provided for any additional software against the update revision that is selected.

## Remediation

### From Console

Perform the following action to check latest version installed:

1. Login to Azure Portal and go to `App Services`.
2. Click on each App.
3. Under `Settings` section, click on `Configuration`.
4. Go to `General settings` tab.
5. Under `Stack settings`, ensure `Java version` is set to latest version.

**Note** No action is required, If Stack is not using Java, as it is not used by your web app.

### From Command Line

To see the list of supported runtimes:

```bash
az webapp list-runtimes | grep java
```

To set latest Java version for an existing app, run the following command:

```bash
az webapp config set --resource-group <RESOURCE_GROUP_NAME> --name <APP_NAME> --java-version '1.8' --java-container 'Tomcat' --java-container-version '<VERSION>'
```
