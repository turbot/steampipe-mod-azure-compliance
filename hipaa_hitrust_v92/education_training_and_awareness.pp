benchmark "hipaa_hitrust_v92_education_training_and_awareness" {
  title       = "13 Education, Training and Awareness"
  description = "The organization prohibits users from installing unauthorized software, including data and software from external networks, and ensures users are made aware and trained on these requirements."
  children = [
    benchmark.hipaa_hitrust_v92_1325_09s1organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1325_09s1organizational" {
  title       = "1325.09s1Organizational.3-09.s 09.08 Exchange of Information"
  description = "Ensure the exchange of information within an organization and with any external entity is secured and protected, and carried out in compliance with relevant legislation and exchange agreements."
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}
