## Description

For added security, only install organization-approved extensions on VMs.

Azure virtual machine extensions are small applications that provide post-deployment configuration and automation tasks on Azure virtual machines. These extensions run with administrative privileges and could potentially access anything on a virtual machine. The Azure Portal and community provide several such extensions. Each organization should carefully evaluate these extensions and ensure that only those that are approved for use are actually implemented.

## Remediation

### From Azure Portal

1. Go to `Virtual machines`.
2. For each virtual machine, go to `Settings`.
3. Click on `Extensions + applications`.
4. If there are unapproved extensions, uninstall them.

### From Azure CLI

From the audit command identify the unapproved extensions, and use the below CLI command to remove an unapproved extension attached to VM.

```bash
az vm extension delete --resource-group <resourceGroupName> --vm-name <vmName> --name <extensionName>
```

### From PowerShell

For each VM and each insecure extension from the Audit Procedure run the following command.

```bash
Remove-AzVMExtension -ResourceGroupName <ResourceGroupName> -Name <ExtensionName> -VMName <VirtualMachineName>
```

### Default Value

By default, no extensions are added to the virtual machines.
