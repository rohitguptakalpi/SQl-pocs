/*
   Sunday, June 13, 20214:52:09 PM
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
EXECUTE sp_rename N'dbo.discounts.discount', N'Tmp_discount_percent', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.discounts.Tmp_discount_percent', N'discount_percent', 'COLUMN' 
GO
ALTER TABLE dbo.discounts
	DROP COLUMN type
GO
ALTER TABLE dbo.discounts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.discounts', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.discounts', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.discounts', 'Object', 'CONTROL') as Contr_Per 