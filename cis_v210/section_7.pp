locals {
  cis_v210_7_common_tags = merge(local.cis_v210_common_tags, {
    cis_section_id = "7"
  })
}

benchmark "cis_v210_7" {
  title         = "7 Virtual Machines"
  documentation = file("./cis_v210/docs/cis_v210_7.md")
  children = [
    control.cis_v210_7_1,
    control.cis_v210_7_2,
    control.cis_v210_7_3,
    control.cis_v210_7_4,
    control.cis_v210_7_5,
    control.cis_v210_7_6,
    control.cis_v210_7_7,
    control.cis_v210_7_8,
    control.cis_v210_7_9
  ]

  tags = merge(local.cis_v210_7_common_tags, {
    type    = "Benchmark"
    service = "Azure/Compute"
  })
}

control "cis_v210_7_1" {
  title         = "7.1 Ensure an Azure Bastion Host Exists"
  description   = "The Azure Bastion service allows secure remote access to Azure Virtual Machines over the Internet without exposing remote access protocol ports and services directly to the Internet. The Azure Bastion service provides this access using TLS over 443/TCP, and subscribes to hardened configurations within an organization's Azure Active Directory service."
  query         = query.network_bastion_host_min_1
  documentation = file("./cis_v210/docs/cis_v210_7_1.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_2" {
  title         = "7.2 Ensure Virtual Machines are utilizing Managed Disks"
  description   = "Migrate blob-based VHDs to Managed Disks on Virtual Machines to exploit the default features of this configuration."
  query         = query.compute_vm_utilizing_managed_disk
  documentation = file("./cis_v210/docs/cis_v210_7_2.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_3" {
  title         = "7.3 Ensure that 'OS and Data' disks are encrypted with Customer Managed Key (CMK)"
  description   = "Ensure that OS disks (boot volumes) and data disks (non-boot volumes) are encrypted with CMK (Customer Managed Keys). Customer Managed keys can be either ADE or Server Side Encryption(SSE)."
  query         = query.compute_os_and_data_disk_encrypted_with_cmk
  documentation = file("./cis_v210/docs/cis_v210_7_3.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_4" {
  title         = "7.4 Ensure that 'Unattached disks' are encrypted with 'Customer Managed Key' (CMK)"
  description   = "Ensure that unattached disks in a subscription are encrypted with a Customer Managed Key (CMK)."
  query         = query.compute_unattached_disk_encrypted_with_cmk
  documentation = file("./cis_v210/docs/cis_v210_7_4.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_5" {
  title         = "7.5 Ensure that Only Approved Extensions Are Installed"
  description   = "For added security, only install organization-approved extensions on VMs."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_7_5.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_6" {
  title         = "7.6 Ensure that Endpoint Protection for all Virtual Machines is installed"
  description   = "Install endpoint protection for all virtual machines."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_7_6.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_7" {
  title         = "7.7 [Legacy] Ensure that VHDs are Encrypted"
  description   = "VHD (Virtual Hard Disks) are stored in blob storage and are the old-style disks that were attached to Virtual Machines. The blob VHD was then leased to the VM. By default, storage accounts are not encrypted, and Microsoft Defender will then recommend that the OS disks should be encrypted. Storage accounts can be encrypted as a whole using PMK or CMK. This should be turned on for storage accounts containing VHDs."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_7_7.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_8" {
  title         = "7.8 Ensure only MFA enabled identities can access privileged Virtual Machine"
  description   = "Verify identities without MFA that can log in to a privileged virtual machine using separate login credentials. An adversary can leverage the access to move laterally and perform actions with the virtual machine's managed identity. Make sure the virtual machine only has necessary permissions, and revoke the admin-level permissions according to the least privileges principal."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_7_8.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}

control "cis_v210_7_9" {
  title         = "7.9 Ensure Trusted Launch is enabled on Virtual Machines"
  description   = "When Secure Boot and vTPM are enabled together, they provide a strong foundation for protecting your VM from boot attacks. For example, if an attacker attempts to replace the bootloader with a malicious version, Secure Boot will prevent the VM from booting."
  query         = query.compute_vm_trust_launch_enabled
  documentation = file("./cis_v210/docs/cis_v210_7_9.md")

  tags = merge(local.cis_v210_7_common_tags, {
    cis_item_id = "7.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Compute"
  })
}