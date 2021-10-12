---
repository: "https://github.com/turbot/steampipe-mod-azure-compliance"
---

# Azure Compliance Mod

Run individual configuration, compliance and security controls or full `CIS`, `HIPAA HITRUST` and `NIST` compliance benchmarks across all your Azure subscriptions.

## References

[Azure](https://azure.microsoft.com) provides on-demand cloud computing platforms and APIs to authenticated customers on a metered pay-as-you-go basis.

[CIS Azure Benchmarks](https://www.cisecurity.org/benchmark/azure/) provide a predefined set of compliance and security best-practice checks for Microsoft Azure usage.

[HIPAA HITRUST 9.2](https://docs.microsoft.com/en-us/azure/governance/policy/samples/hipaa-hitrust-9-2) provides a combined set of predefined compliance and security best-practice checks for Health Insurance Portability and Accountability Act.

[NIST SP 800-53 Revision 5](https://docs.microsoft.com/en-us/azure/governance/policy/samples/nist-sp-800-53-r5) defines the standards and guidelines for federal agencies to architect and manage their information security systems.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/azure_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/azure_compliance/queries)**

## Get started

Install the Azure plugin with [Steampipe](https://steampipe.io):

```shell
steampipe plugin install azure
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-azure-compliance.git
cd steampipe-mod-azure-compliance
```

Run all benchmarks:

```shell
steampipe check all
```

Run a benchmark:

```shell
steampipe check benchmark.cis_v130
```

Run a specific control:

```shell
steampipe check control.cis_v130_2_1_1
```

### Credentials

This mod uses the credentials configured in the [Steampipe Azure plugin](https://hub.steampipe.io/plugins/turbot/azure).

### Configuration

No extra configuration is required.

## Get involved

- Contribute: [GitHub Repo](https://github.com/turbot/steampipe-mod-azure-compliance)
- Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
