CREATE TABLE [dbo].[SaleDetail]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [SaleId] INT NOT NULL REFERENCES [Sale](Id), 
    [ProductId] INT NOT NULL REFERENCES [Product](Id),
    [Quantity] INT NOT NULL DEFAULT 1,
    [PurchasePrice] DECIMAL(10, 2) NOT NULL, 
    [Tax] DECIMAL(10, 2) NOT NULL DEFAULT 0
)
