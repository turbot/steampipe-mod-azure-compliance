locals {
  soc_2_cc_5_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc5"
  })
}

benchmark "soc_2_cc_5" {
  title       = "CC5.0 - Control Activities"
  description = "The criteria relevant to how the entity (i) selects and develops control activities, (ii) selects and develops general controls over technology, and (iii) deploys through policies and procedures."

  children = [
    benchmark.soc_2_cc_5_2,
    control.storage_account_queue_services_logging_enabled,
    control.storage_account_blob_containers_public_access_private,
    control.storage_account_blob_service_logging_enabled
  ]

  tags = local.soc_2_cc_5_common_tags
}

benchmark "soc_2_cc_5_2" {
  title         = "CC5.2 COSO Principle 11: The entity also selects and develops general control activities over technology to support the achievement of objectives"
  documentation = file("./soc2/docs/cc_5_2.md")

  children = [
    control.storage_account_queue_services_logging_enabled,
    control.storage_account_blob_containers_public_access_private,
    control.storage_account_blob_service_logging_enabled
  ]

  tags = merge(local.soc_2_cc_5_common_tags, {
    soc_2_item_id = "5.2"
    soc_2_type    = "manual"
  })
}