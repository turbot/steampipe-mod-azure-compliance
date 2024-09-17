## Overview

This section covers security recommendations to set identity and access management policies on an Azure Subscription. Identity and Access Management policies are the first step towards a defense-in-depth approach to securing an Azure Cloud Platform environment.

Many of the recommendations from this section are marked as "Manual" while the existing Azure CLI and Azure AD PowerShell support through the Azure AD Graph are being depreciated. It is now recommended to use the new Microsoft Graph in replacement of Azure AD Graph for PowerShell and API level access. From a security posture standpoint, these recommendations are still very important and should not be discounted because they are "Manual." As automation capability using Rest API is developed for this Benchmark, the related recommendations will be updated with the respective audit and remediation steps and changed to an "automated" assessment status.

If any problems are encountered running Azure CLI or PowerShell methodologies, please refer to the Overview for this benchmark where you will find additional detail on permission and required cmdlets.