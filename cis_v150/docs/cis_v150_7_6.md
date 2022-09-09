## Description

VHD (Virtual Hard Disks) are stored in BLOB storage and are the old style disks that were attached to Virtual Machines, and the BLOB VHD was then leased to the VM. By Default storage accounts are not encrypted, and Azure Defender(Security Centre) would then recommend that the OS disks should be encrypted. Storage accounts can be encrypted as a whole using PMK or CMK and this should be turned on for storage accounts containing VHD's.

While it is recommended to use Managed Disks which are encrypted by default, "legacy" VHDs may exist for a variety of reasons and may need to remain in VHD format. VHDs are not encrypted by default, so this recommendation intends to address the security of these disks. In these niche cases, VHDs should be encrypted using the procedures in this recommendation to encrypt and protect the data content.

If a virtual machine is using a VHD and can be converted to a managed disk, instructions for this procedure can be found in the resources section of this recommendation under the title "Convert VHD to Managed Disk."

## Remediation

### From Azure Portal

1. Navigate to the `storage account` that you wish to encrypt
2. Select `encryption`
3. Select the `encryption type` that you wish to use

If you wish to use a Microsoft-managed key (the default), you can save at this point and encryption will be applied to the account.
If you select `Customer-managed keys`, it will ask for the location of the key (The default is an Azure Key Vault) and the key name.
Once these are captured, save the configuration and the account will be encrypted using the provided key.

### From Azure CLI

Create the Keyvault

```bash
az keyvault create --name "myKV" --resource-group "myResourceGroup" -- location eastus --enabled-for-disk-encryption
```

Encrypt the disk and store the key in keyvault

```bash
az vm encryption enable -g MyResourceGroup --name MyVM --disk-encryption- keyvault myKV
```

### From Azure PowerShell

This process uses a Key Vault to store the keys

Create the Key Vault

```bash
New-AzKeyvault -name <name> -ResourceGroupName <resourceGroup> -Location <location> -EnabledForDiskEncryption
```

Encrypt the disk and store the key in Key Vault

```bash
$KeyVault = Get-AzKeyVault -VaultName <name> -ResourceGroupName <resourceGroup> Set-AzVMDiskEncryptionExtension -ResourceGroupName <resourceGroup> -VMName <name> -DiskEncryptionKeyVaultUrl $KeyVault.VaultUri - DiskEncryptionKeyVaultId $KeyVault.ResourceId
```

### Default Value

The default value for encryption is "NO Encryption".