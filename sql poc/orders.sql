/*
   Sunday, June 13, 20211:03:47 PM
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
CREATE TABLE dbo.orders
	(
	order_id int NOT NULL,
	order_no nchar(10) NOT NULL,
	user_id int NOT NULL,
	address_id int NOT NULL,
	discount_id int NULL,
	order_date date NOT NULL,
	shipping_date date NOT NULL,
	shipping_status nchar(10) NOT NULL,
	total_amount money NOT NULL,
	is_delivered nchar(20) NOT NULL,
	is_payment nchar(20) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.orders ADD CONSTRAINT
	PK_orders PRIMARY KEY CLUSTERED 
	(
	order_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.orders SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.orders', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.orders', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.orders', 'Object', 'CONTROL') as Contr_Per 