---
repository: "https://github.com/turbot/steampipe-mod-azure-compliance"
---

# Azure Compliance Mod

Run individual configuration, compliance and security controls or full `CIS`, `HIPAA HITRUST`, `NIST` and `PCI DSS` compliance benchmarks across all your Azure subscriptions.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_cis_v130_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_cis_v130_console.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_hipaa_hitrust_dashboard.png" width="50%" type="thumbnail"/>

## References

[Azure](https://azure.microsoft.com) provides on-demand cloud computing platforms and APIs to authenticated customers on a metered pay-as-you-go basis.

[CIS Azure Benchmarks](https://www.cisecurity.org/benchmark/azure/) provide a predefined set of compliance and security best-practice checks for Microsoft Azure usage.

[HIPAA HITRUST 9.2](https://docs.microsoft.com/en-us/azure/governance/policy/samples/hipaa-hitrust-9-2) provides a combined set of predefined compliance and security best-practice checks for Health Insurance Portability and Accountability Act.

[NIST SP 800-53 Revision 5](https://docs.microsoft.com/en-us/azure/governance/policy/samples/nist-sp-800-53-r5) defines the standards and guidelines for federal agencies to architect and manage their information security systems.

[PCI DSS v3.2.1](https://learn.microsoft.com/en-us/azure/governance/policy/samples/pci-dss-3-2-1) applies to all entities that store, process, and/or transmit cardholder data. It covers technical and operational system components included in or connected to cardholder data.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/azure_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/azure_compliance/queries)**

## Getting started

### Installation

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Install the Azure and the Azure Active Directory plugins with [Steampipe](https://steampipe.io):

```sh
steampipe plugin install azure
steampipe plugin install azuread
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-azure-compliance.git
cd steampipe-mod-azure-compliance
```

### Usage

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at http://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `steampipe check` command:

Run all controls:

```sh
steampipe check benchmark.all_controls
`

Run a benchmark:

```sh
steampipe check benchmark.cis_v130
```

Run a specific control:

```sh
steampipe check control.cis_v130_2_1_1
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe Azure plugin](https://hub.steampipe.io/plugins/turbot/azure) and the [Steampipe Azure Active Directory plugin](https://hub.steampipe.io/plugins/turbot/azuread).

### Configuration

No extra configuration is required.

### Common and Tag Dimensions

The benchmark queries use common properties (like `connection_name`, `resource_group`, `region`, `subscription` and `subscription_id`) and tags that are defined in the form of a default list of strings in the `mod.sp` file. These properties can be overwritten in several ways:

- Copy and rename the `steampipe.spvars.example` file to `steampipe.spvars`, and then modify the variable values inside that file
- Pass in a value on the command line:

  ```shell
  steampipe check benchmark.cis_v140 --var 'common_dimensions=["resource_group", "region", "subscription", "subscription_id"]'
  ```

  ```shell
  steampipe check benchmark.cis_v140 --var 'tag_dimensions=["Department", "Environment"]'
  ```

- Set an environment variable:

  ```shell
  SP_VAR_common_dimensions='["resource_group", "region", "subscription", "subscription_id"]' steampipe check control.storage_account_use_virtual_service_endpoint
  ```

  ```shell
  SP_VAR_tag_dimensions='["Department", "Environment"]' steampipe check control.storage_account_use_virtual_service_endpoint
  ```

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing.

- **[Join #steampipe on Slack →](https://turbot.com/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-azure-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Azure Compliance Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)
