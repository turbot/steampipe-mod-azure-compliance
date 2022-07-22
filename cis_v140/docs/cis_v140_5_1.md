## Overview

The Azure Diagnostic Settings capture control/management activities performed on a subscription. By default, the Azure Portal retains activity logs only for
90 days. The Diagnostic Settings define the type of events that are stored or streamed and the outputs— storage account and/or event hub. The Diagnostic Settings, if configured properly, can ensure that all activity logs are retained for longer duration. This section has recommendations for correctly
configuring the Diagnostic Settings so that all activity logs captured are retained for longer periods.

When configuring Diagnostic Settings you may choose to export in one of three ways in which you need to ensure appropriate data retention. The options are Log Analytics, Event Hub, and a Storage Account. It is important to ensure you are aware and have set retention as your organization sees fit.
