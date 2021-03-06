/*
   Sunday, June 13, 202112:41:42 PM
   User: 
   Server: .
   Database: ecommercedb
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.address
	(
	address_id int NOT NULL,
	user_id int NOT NULL,
	full_name nchar(50) NOT NULL,
	street nchar(100) NOT NULL,
	landmark nchar(100) NULL,
	postcode nchar(10) NOT NULL,
	city nchar(50) NOT NULL,
	state nchar(50) NOT NULL,
	country nchar(50) NOT NULL,
	mobile_no nchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.address ADD CONSTRAINT
	PK_address PRIMARY KEY CLUSTERED 
	(
	address_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.address ADD CONSTRAINT
	FK_address_address FOREIGN KEY
	(
	address_id
	) REFERENCES dbo.address
	(
	address_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.address SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.address', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.address', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.address', 'Object', 'CONTROL') as Contr_Per 