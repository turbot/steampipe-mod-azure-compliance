## Overview

As more services are exposed to the public internet it is important to be able to monitor the externally exposed surface of your Azure Tenant, to this end it is recommended that tools that monitor this surface are implemented.

Microsoft have a new tool to do this in their Defender Suite of products. Defender EASM, this tool is configured very simply to scan specified domains and report on them, specific domains and addresses can be excluded from the scan.

Typically these tools will report on any vulnerability that is identified (CVE) and will also identify ports and protocols that are open on devices.

Results are classified Critical/High/Medium & Low with proposed mitigations.
