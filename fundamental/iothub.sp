locals {
  fundamental_security_iothub_common_tags = {
    service = "Azure/IoTHub"
  }
}

benchmark "fundamental_security_iothub" {
  title       = "IoT Hub"
  description = "This section contains recommendations for configuring IoTHub resources."
  children = [
    control.iot_hub_logging_enabled,
    control.iot_hub_private_link_used
  ]
}
