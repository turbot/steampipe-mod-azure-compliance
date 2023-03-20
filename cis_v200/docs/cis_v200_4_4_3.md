## Description

Enable audit_log_enabled on MySQL Servers.

Enabling audit_log_enabled helps MySQL Database to log items such as connection attempts to the server, DDL/DML access, and more. Log data can be used to identify, troubleshoot, and repair configuration errors and suboptimal performance.

## Remediation

### From Azure Portal

1. Login to Azure Portal using [https://portal.azure.com](https://portal.azure.com).
2. Select `Azure Database for MySQL Servers`.
3. Select a database.
4. Under Settings, select `Server parameters`.
5. Update `audit_log_enabled` parameter to ON
6. Under Monitoring, select `Diagnostic settings`.
7. Select `+ Add diagnostic setting`.
8. Provide a diagnostic setting name.
9. Under Categories, select `MySQL Audit Logs`.
10. Specify destination details.
11. Click `Save`.

It may take up to 10 minutes for the logs to appear in the configured destination.

### Default Value

audit_log_enabled is set to OFF by default
