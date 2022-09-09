## Description

Set `audit_log_enabled` to include CONNECTION on `MySQL` Servers

Enabling CONNECTION helps MySQL Database to log items such as successful and failed connection attempts to the server. Log data can be used to identify, troubleshoot, and repair configuration errors and suboptimal performance.

## Remediation

### From Azure Portal

1. From Azure Home select the Portal Menu
2. Select your Azure Database for MySQL server
3. For each database, under the Settings section in the sidebar, select Server parameters
4. Update the audit_log_enabled parameter to ON
5. Select the event types to be logged by updating the audit_log_events parameter; ensure CONNECTION is set
6. Under the Monitoring section in the sidebar, select Diagnostic settings.
7. Provide a diagnostic setting name
8. Specify which data sinks to send the audit logs (storage account, event hub, and/or Log Analytics workspace)
9. Select "MySqlAuditLogs" as the log type
10. Once you've configured the data sinks to pipe the audit logs to, you can click Save
11. Access the audit logs by exploring them in the data sinks you configured. It may take up to 10 minutes for the logs to appear

### Default Value

By default audit_log_events is disabled.