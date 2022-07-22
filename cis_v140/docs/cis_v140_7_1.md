## Description

Migrate BLOB based VHD's to Managed Disks on Virtual Machines to exploit the default features of this configuration. The features include
  - Default Disk Encryption
  - Resilience as Microsoft will managed the disk storage and move around if underlying hardware goes faulty
  - Reduction of costs over storage accounts

Managed disks are by default encrypted on the underlying hardware so no additional encryption is required for basic protection, it is available if additional encryption is required. Managed disks are by design more resilient that storage accounts. For ARM deployed Virtual Machines, Azure Adviser will at some point recommend moving VHD's to managed disks both from a security and cost management perspective.

## Remediation

### From Console

Perform the following action to check VM are utilizing managed disks:

1. Using the search feature, go to `Virtual Machines`.
2. From `Manage view`, select `Edit columns`.
3. Add `Uses managed disks` to the selected columns.
4. Select `Save`.
5. Ensure virtual machine listed are using a managed disk. `Uses managed disks` column value is `Yes`.

Perform the following action to add a managed disk to a VM:

1. Using the search feature, go to `Virtual Machines`.
2. Select the virtual machine you would like to convert
3. From `Settings` section, select `Disks`.
4. At the top select `Migrate to managed disks`.
5. Select `Migrate` to start the process.

**Note** On converting to managed disks VMs will be powered off and back on.
