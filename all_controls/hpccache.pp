locals {
  all_controls_hpccache_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/HPCCache"
  })
}

benchmark "all_controls_hpccache" {
  title       = "HPC Cache"
  description = "This section contains recommendations for configuring HPC Cache resources."
  children = [
    control.hpc_cache_encrypted_with_cmk
  ]

  tags = merge(local.all_controls_hpccache_common_tags, {
    type = "Benchmark"
  })
}
