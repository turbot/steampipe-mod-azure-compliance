locals {
  controls_by_service_iothub_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/IoTHub"
  })
}

benchmark "controls_by_service_iothub" {
  title       = "IoT Hub"
  description = "This section contains recommendations for configuring IoT Hub resources."
  children = [
    control.iot_hub_logging_enabled,
    control.iot_hub_private_link_used
  ]

  tags = merge(local.controls_by_service_iothub_common_tags, {
    type = "Benchmark"
  })
}
