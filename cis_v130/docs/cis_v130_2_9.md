## Description

This setting enables Windows Defender ATP (WDATP) integration with Security Center. WDATP integration brings comprehensive Endpoint Detection and Response (EDR) capabilities within security center. This integration helps to spot abnormalities, detect and respond to advanced attacks on Windows server endpoints monitored by Azure Security Center.

Windows Defender ATP in Security Center supports detection on Windows Server 2016, 2012 R2, and 2008 R2 SP1 operating systems in a Standard service subscription. WDATP works only with Standard Tier subscriptions.

## Remediation

### From Console

Perform the following action to check Azure Defender is set to On for Key Vault:

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the subscription name, select `Threat Detection`.
4. Ensure setting `Allow Microsoft Defender ATP to access my data` is selected.

Perform the following action to enable Azure Defender for Key Vault:

1. Login to Azure console and navigate to [Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0).
2. Select `Pricing & settings` blade under Management.
3. Click on the subscription name, select `Threat Detection`.
4. Select `Allow Microsoft Defender ATP to access my data`.
5. Click **Save**.
