## Description

It is recommended to use *Azure Active Directory Authentication* for authentication with SQL Database. It is a mechanism to connect to Microsoft Azure SQL Database and SQL Data Warehouse by using identities in Azure Active Directory (Azure AD). With Azure AD authentication, identities of database users and other Microsoft services can be managed in one central location. Central ID management provides a single place to manage database users and simplifies permission management.

  - It provides an alternative to SQL Server authentication.
  - Helps stop the proliferation of user identities across database servers and manage password rotation in a one place.
  - Customers can manage database permissions using external (AAD) groups.
  - Azure AD authentication uses contained database users to authenticate identities at the database level.
  - Azure AD supports token-based authentication for applications connecting to SQL database.
  - Azure AD authentication supports ADFS (domain federation) or native user/password authentication for a local Azure Active Directory without domain      synchronization.
  - Azure AD supports connections from SQL Server Management Studio that use Active Directory Universal Authentication, which includes Multi-Factor Authentication (MFA). MFA includes strong authentication with a range of easy verification options — phone call, text message, smart cards with pin, or mobile app notification.

## Remediation

### From Console

Perform the following action to check whether access from Azure services is enabled:

1. Login to Azure console and navigate to [SQL Servers](https://portal.azure.com/#create/Microsoft.SQLServer).
2. For SQL server, go to `Settings` section from left pane.
3. Click on `Active Directory admin`.
4. Click on `Set admin` and select an admin.
5. Click **Save**.

### From Command Line

Get ObjectID of user

```bash
az ad user list --query "[?mail==<emailId of user>].{mail:mail, userPrincipalName:userPrincipalName, objectId:objectId}"
```

For each Server, set AD Admin

```bash
az sql server ad-admin create --resource-group <resource group name> --server <server name> --display-name <display name> --object-id <object id of user>
```

**Note** By default Azure Active Directory Authentication for SQL Database/Server is not enabled.
