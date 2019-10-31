CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(MAX) NULL, 
	[RetailPrice] DECIMAL(10,2) NOT NULL,
    [CreatedDate] SMALLDATETIME NOT NULL DEFAULT getutcdate(), 
    [LastModified] SMALLDATETIME NOT NULL DEFAULT getutcdate()
)
