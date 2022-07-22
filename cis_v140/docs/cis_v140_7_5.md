## Description

It is recommended the latest OS patches for all virtual machines are applied. The Azure Security Center retrieves a list of available security and critical updates from Windows Update or Windows Server Update Services (WSUS), depending on which service is configured on a Windows VM. The security center also checks for the latest updates in Linux systems. If a VM is missing a system update, the security center will recommend system updates be applied.

Windows and Linux virtual machines should be kept updated to:

   - Fix a security vulnerability
   - Improve an OS or application’s general stability
   - Address a specific bug or flaw

## Remediation

### From Console

Perform the following action to check latest OS patches are applied on VM:

1. Go to `Security Center - Recommendations`.
2. Ensure that there are no recommendations available for `Apply system updates`.

Follow Microsoft Azure documentation to apply security patches from the security center - [Security-benchmarks](https://docs.microsoft.com/en-us/security/benchmark/azure/security-controls-v2-posture-vulnerability-management#pv-7-rapidly-and-automatically-remediate-software-vulnerabilities)

**Note**

- By default, patches are not automatically deployed.
- You can deploy your own patch assessment and management tool to periodically assess, report and install the required security patches for your OS.

