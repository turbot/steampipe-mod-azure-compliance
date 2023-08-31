locals {
  all_controls_iothub_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/IoTHub"
  })
}

benchmark "all_controls_iothub" {
  title       = "IoT Hub"
  description = "This section contains recommendations for configuring IoT Hub resources."
  children = [
    control.iot_hub_logging_enabled,
    control.iot_hub_private_link_used
  ]

  tags = merge(local.all_controls_iothub_common_tags, {
    type = "Benchmark"
  })
}
