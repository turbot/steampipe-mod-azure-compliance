## Description

Use Azure Active Directory Authentication for authentication with SQL Database to manage credentials in a single place.

Azure Active Directory authentication is a mechanism to connect to Microsoft Azure SQL Database and SQL Data Warehouse by using identities in Azure Active Directory (Azure AD). With Azure AD authentication, identities of database users and other Microsoft services can be managed in one central location. Central ID management provides a single place to manage database users and simplifies permission management.
- It provides an alternative to SQL Server authentication.
- Helps stop the proliferation of user identities across database servers.
- Allows password rotation in a single place.
- Customers can manage database permissions using external (AAD) groups.
- It can eliminate storing passwords by enabling integrated Windows authentication and other forms of authentication supported by Azure Active Directory.
- Azure AD authentication uses contained database users to authenticate identities at the database level.
- Azure AD supports token-based authentication for applications connecting to SQL Database.
- Azure AD authentication supports ADFS (domain federation) or native user/password authentication for a local Azure Active Directory without domain synchronization.
- Azure AD supports connections from SQL Server Management Studio that use Active Directory Universal Authentication, which includes Multi-Factor Authentication (MFA). MFA includes strong authentication with a range of easy verification options — phone call, text message, smart cards with pin, or mobile app notification.

## Remediation

### From Azure Console

1. Go to `SQL servers`.
2. For each SQL server, click on `Active Directory admin`.
3. Click on `Set admin`.
4. Select an admin.
5. Click `Save`.

### From Azure CLI

```bash
az ad user show --id
```

For each Server, set AD Admin

```bash
az sql server ad-admin create --resource-group <resource group name> --server <server name> --display-name <display name> --object-id <object id of user>
```

### Using PowerShell

For each Server, set AD Admin

```bash
Set-AzSqlServerActiveDirectoryAdministrator -ResourceGroupName <resource group name> -ServerName <server name> -DisplayName "<Display name of AD account to set as DB administrator>"
```

### Default Value

Azure Active Directory Authentication for SQL Database/Server is not enabled by default.
