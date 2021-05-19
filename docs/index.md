# Azure Compliance Mod

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Azure](https://azure.amazon.com/) provides on-demand cloud computing platforms and APIs to authenticated customers on a metered pay-as-you-go basis. 

## Documentation

Each benchmark should have its own documentation in its `docs` directory.

## Get started

Install the Azure plugin with [Steampipe](https://steampipe.io):
```shell
steampipe plugin install azure
```

Clone:
```sh
git clone git@github.com:turbot/steampipe-mod-azure-compliance
cd steampipe-mod-azure-compliance
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

* Open source: https://github.com/turbot/steampipe-mod-azure-compliance
* Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
