benchmark "hipaa_hitrust_v92_back_up" {
  title       = "Back-up"
  description = "TO DO"
  children = [
    // benchmark.hipaa_hitrust_v92_1699_09l1organizational_10_09_l
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

// benchmark "hipaa_hitrust_v92_1699_09l1organizational_10_09_l" {
//   title       = "Workforce members roles and responsibilities in the data backup process are identified and communicated to the workforce; in particular, Bring Your Own Device (BYOD) users are required to perform backups of organizational and/or client data on their devices"
//   description = "TO DO"
//   children = [
//     control.
//   ]

//   tags = merge(local.hipaa_hitrust_v92_common_tags, {
//     service = "Azure/MySQL"
//   })
// }