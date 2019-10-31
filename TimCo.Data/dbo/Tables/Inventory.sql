CREATE TABLE [dbo].[Inventory]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductId] INT NOT NULL REFERENCES [Product](Id), 
	[Quantity] INT NOT NULL DEFAULT 1,
    [PurchasePrice] DECIMAL(10, 2) NOT NULL, 
    [PurchaseDate] SMALLDATETIME NOT NULL DEFAULT getutcdate()
)
