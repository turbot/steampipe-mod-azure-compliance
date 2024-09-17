locals {
  cis_v300_8_common_tags = merge(local.cis_v300_common_tags, {
    cis_section_id = "8"
  })
}

benchmark "cis_v300_8" {
  title         = "8 Virtual Machines"
  documentation = file("./cis_v300/docs/cis_v300_8.md")
  children = [
    control.cis_v300_8_1,
    control.cis_v300_8_2,
    control.cis_v300_8_3,
    control.cis_v300_8_4,
    control.cis_v300_8_5,
    control.cis_v300_8_6,
    control.cis_v300_8_7,
    control.cis_v300_8_8,
    control.cis_v300_8_9,
    control.cis_v300_8_10,
    control.cis_v300_8_11
  ]

  tags = merge(local.cis_v300_8_common_tags, {
    type    = "Benchmark"
    service = "Azure/Compute"
  })
}

control "cis_v300_8_1" {
  title         = "8.1 Ensure an Azure Bastion Host Exists"
  description   = "The Azure Bastion service allows secure remote access to Azure Virtual Machines over the Internet without exposing remote access protocol ports and services directly to the Internet. The Azure Bastion service provides this access using TLS over 443/TCP, and subscribes to hardened configurations within an organization's Azure Active Directory service."
  query         = query.network_bastion_host_min_1
  documentation = file("./cis_v300/docs/cis_v300_8_1.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_2" {
  title         = "8.2 Ensure Virtual Machines are utilizing Managed Disks"
  description   = "Migrate blob-based VHDs to Managed Disks on Virtual Machines to exploit the default features of this configuration."
  query         = query.compute_vm_utilizing_managed_disk
  documentation = file("./cis_v300/docs/cis_v300_8_2.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_3" {
  title         = "8.3 Ensure that 'OS and Data' disks are encrypted with Customer Managed Key (CMK)"
  description   = "Ensure that OS disks (boot volumes) and data disks (non-boot volumes) are encrypted with CMK (Customer Managed Keys). Customer Managed keys can be either ADE or Server Side Encryption(SSE)."
  query         = query.compute_os_and_data_disk_encrypted_with_cmk
  documentation = file("./cis_v300/docs/cis_v300_8_3.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_4" {
  title         = "8.4 Ensure that 'Unattached disks' are encrypted with 'Customer Managed Key' (CMK)"
  description   = "Ensure that unattached disks in a subscription are encrypted with a Customer Managed Key (CMK)."
  query         = query.compute_unattached_disk_encrypted_with_cmk
  documentation = file("./cis_v300/docs/cis_v300_8_4.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_5" {
  title         = "8.5 Ensure that 'Disk Network Access' is NOT set to 'Enable public access from all networks'"
  description   = "Virtual Machine Disks and snapshots can be configured to allow access from different network resources."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_5.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_6" {
  title         = "8.6 Ensure that 'Enable Data Access Authentication Mode' is 'Checked'"
  description   = "Data Access Authentication Mode provides a method of uploading or exporting Virtual Machine Disks."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_6.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_7" {
  title         = "8.7 Ensure that Only Approved Extensions Are Installed"
  description   = "For added security, only install organization-approved extensions on VMs."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_7.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_8" {
  title         = "8.8 Ensure that Endpoint Protection for all Virtual Machines is installed"
  description   = "Install endpoint protection for all virtual machines."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_8.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.8"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_9" {
  title         = "8.9 [Legacy] Ensure that VHDs are Encrypted"
  description   = "VHD (Virtual Hard Disks) are stored in blob storage and are the old-style disks that were attached to Virtual Machines. The blob VHD was then leased to the VM. By default, storage accounts are not encrypted, and Microsoft Defender will then recommend that the OS disks should be encrypted. Storage accounts can be encrypted as a whole using PMK or CMK. This should be turned on for storage accounts containing VHDs."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_9.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_10" {
  title         = "8.10 Ensure only MFA enabled identities can access privileged Virtual Machine"
  description   = "Verify identities without MFA that can log in to a privileged virtual machine using separate login credentials. An adversary can leverage the access to move laterally and perform actions with the virtual machine's managed identity. Make sure the virtual machine only has necessary permissions, and revoke the admin-level permissions according to the least privileges principal."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_10.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v300_8_11" {
  title         = "8.11 Ensure Trusted Launch is enabled on Virtual Machines"
  description   = "When Secure Boot and vTPM are enabled together, they provide a strong foundation for protecting your VM from boot attacks. For example, if an attacker attempts to replace the bootloader with a malicious version, Secure Boot will prevent the VM from booting."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_8_11.md")

  tags = merge(local.cis_v300_8_common_tags, {
    cis_item_id = "8.11"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}