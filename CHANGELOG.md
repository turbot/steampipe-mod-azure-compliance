## v0.13 [2022-05-12]

_Bug fixes_

- Fixed `sql_server_auditing_storage_account_destination_retention_90_days` and `sql_server_auditing_retention_period_90` queries to correctly evaluate the SQL servers when the audit retention period is set to `0`. ([#105](https://github.com/turbot/steampipe-mod-azure-compliance/pull/105))

## v0.12 [2022-05-09]

_Enhancements_

- Updated docs/index.md and README with new dashboard screenshots and latest format. ([#102](https://github.com/turbot/steampipe-mod-azure-compliance/pull/102))

## v0.11 [2022-05-02]

_Enhancements_

- Added `category`, `service`, and `type` tags to benchmarks and controls. ([#98](https://github.com/turbot/steampipe-mod-azure-compliance/pull/98))

## v0.10 [2022-01-27]

_Enhancements_

- Updated the `hdinsight_cluster_encrypted_at_rest_with_cmk`, `hdinsight_cluster_encryption_at_host_enabled` and `hdinsight_cluster_encryption_in_transit_enabled` queries to skip those Azure HDInsight clusters where the `provisioning_state` is not `Succeeded` ([#93](https://github.com/turbot/steampipe-mod-azure-compliance/pull/93))

_Bug fixes_

- Fixed the `nist_sp_800_53_rev_5_sc_5` benchmark to correctly reference `network_ddos_enabled` control instead of `network_security_group_udp_service_restricted` control ([#88](https://github.com/turbot/steampipe-mod-azure-compliance/pull/88))
- Fixed the `application_gateway_waf_enabled` control to correctly use `nist_sp_800_53_rev_5 = true` tag instead of `hipaa_hitrust_v92 = true` tag ([#88](https://github.com/turbot/steampipe-mod-azure-compliance/pull/88))

## v0.9 [2021-12-16]

_Enhancements_

- Updated `ad_guest_user_reviewed_monthly`, `iam_deprecated_account`, `iam_deprecated_account_with_owner_roles`, `iam_external_user_with_owner_role`, `iam_external_user_with_read_permission` and `iam_external_user_with_write_permission` queries to use azuread plugin tables instead of deprecated azure tables ([#83](https://github.com/turbot/steampipe-mod-azure-compliance/pull/83))

- Updated the `README` and the `docs/index.md` files to include additional prerequisites for running the compliance checks ([#84](https://github.com/turbot/steampipe-mod-azure-compliance/pull/84))

## v0.8 [2021-11-17]

_Bug fixes_

- Fixed the `mssql_managed_instance_vulnerability_assessment_enabled` query to correctly check if the periodic vulnerability scanning is enabled for a managed SQL instance

## v0.7 [2021-11-10]

_Enhancements_

- `docs/index.md` file now includes the console output image

## v0.6 [2021-10-12]

_What's new?_

- Added: NIST SP 800-53 Revision 5 benchmark (`steampipe check azure_compliance.benchmark.nist_sp_800_53_rev_5`)

## v0.5 [2021-09-02]

_Enhancements_

- Titles of all the HIPAA HITRUST 9.2 compliance benchmarks have been updated for better readability  

## v0.4 [2021-08-26]

_What's new?_

- Added: HIPAA HITRUST 9.2 benchmark (`steampipe check azure_compliance.benchmark.hipaa_hitrust_v92`)

## v0.3 [2021-05-28]

_Bug fixes_

- Minor fixes in the docs

## v0.2 [2021-05-27]

_What's new?_

- Added: Documentation for CIS v1.3.0 benchmarks 1 - 9
- New CIS v1.3.0 controls added
  - 1.22
  - 2.13 - 2.15
  - 5.1.1
  - 5.2.1 - 5.2.9
  - 5.3
  - 8.1 - 8.5
  - 9.1 - 9.11
