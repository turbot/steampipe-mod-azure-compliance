locals {
  fundamental_security_hpccache_common_tags = {
    service = "Azure/HPCCache"
  }
}

benchmark "fundamental_security_hpccache" {
  title       = "HPC Cache"
  description = "This section contains recommendations for configuring HPCCache resources."
  children = [
    control.hpc_cache_encrypted_with_cmk
  ]
}
