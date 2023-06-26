benchmark "hipaa_hitrust_v92_back_up" {
  title       = "Back-up"
  description = "Ensure the maintenance, integrity, and availability of organizational information. Back-up copies of information and software shall be taken and tested regularly."
  children = [
    // benchmark.hipaa_hitrust_v92_1699_09l1organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

// benchmark "hipaa_hitrust_v92_1699_09l1organizational" {
//   title       = "Workforce members roles and responsibilities in the data backup process are identified and communicated to the workforce; in particular, Bring Your Own Device (BYOD) users are required to perform backups of organizational and/or client data on their devices"
//   description = "TO DO"
//   children = [
//     control.
//   ]

//   tags = merge(local.hipaa_hitrust_v92_common_tags, {
//     service = "Azure/MySQL"
//   })
// }