## Description

Enable `audit_log_enabled` on `MySQL` Servers

Enabling audit_log_enabled helps MySQL Database to log items such as connection attempts to the server, DDL/DML access, and more. Log data can be used to identify, troubleshoot, and repair configuration errors and suboptimal performance.

## Remediation

### From Azure Portal

1. Login to Azure Portal using https://portal.azure.com
2. Select your Azure Database for MySQL server
3. For each database, under the Settings section in the sidebar, select Server parameters
4. Update the audit_log_enabled parameter to ON
5. Under the Monitoring section in the sidebar, select Diagnostic settings.
6. Provide a diagnostic setting name
7. Specify which data sinks to send the audit logs (storage account, event hub, and/or Log Analytic workspace)
8. Select "MySqlAuditLogs" as the log type
9. Once you've configured the data sinks to pipe the audit logs to, you can click Save
10. Access the audit logs by exploring them in the data sinks you configured. It may take up to 10 minutes for the logs to appear

### Default Value

By default audit_log_enabled is set to OFF by default.