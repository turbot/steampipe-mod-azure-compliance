benchmark "hipaa_hitrust_v92_education_training_and_awareness" {
  title       = "13 Education, Training and Awareness"
  description = "TO DO"
  children = [
    benchmark.hipaa_hitrust_v92_1325_09s1organizational_3_09_s
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1325_09s1organizational_3_09_s" {
  title       = "1325.09s1Organizational.3-09.s 09.08 Exchange of Information"
  description = "Personnel are appropriately trained on leading principles and practices for all types of information exchange (oral, paper and electronic)"
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}
