locals {
  all_controls_hdinsight_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/HDInsight"
  })
}

benchmark "all_controls_hdinsight" {
  title       = "HDInsight"
  description = "This section contains recommendations for configuring HDInsight resources."
  children = [
    control.hdinsight_cluster_encrypted_at_rest_with_cmk,
    control.hdinsight_cluster_encryption_at_host_enabled,
    control.hdinsight_cluster_encryption_in_transit_enabled
  ]

  tags = merge(local.all_controls_hdinsight_common_tags, {
    type = "Benchmark"
  })
}
