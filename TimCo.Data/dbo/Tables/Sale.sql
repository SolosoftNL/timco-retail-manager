﻿CREATE TABLE [dbo].[Sale]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CashierId] INT NOT NULL REFERENCES [User](Id), 
    [SaleDate] SMALLDATETIME NOT NULL, 
    [SubTotal] DECIMAL(10, 2) NOT NULL, 
    [Tax] DECIMAL(10, 2) NOT NULL, 
    [Total] DECIMAL(10, 2) NOT NULL
)
