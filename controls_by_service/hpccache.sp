locals {
  controls_by_service_hpccache_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/HPCCache"
  })
}

benchmark "controls_by_service_hpccache" {
  title       = "HPC Cache"
  description = "This section contains recommendations for configuring HPC Cache resources."
  children = [
    control.hpc_cache_encrypted_with_cmk
  ]

  tags = merge(local.controls_by_service_hpccache_common_tags, {
    type = "Benchmark"
  })
}
