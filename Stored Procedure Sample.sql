USE [DSTraining]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_OfficeSupplies_CustomerList]    Script Date: 4/29/2022 9:44:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_OfficeSupplies_CustomerList]
-- =============================================
-- Author:		Roger Hayden III
-- Create date: 20220428
-- Description:	RAW -> WRK
-- MOD DATE: 20220428
-- =============================================

AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID('WRK_OfficeSupplies_CustomerList') IS NOT NULL
DROP TABLE [WRK_OfficeSupplies_CustomerList]

-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE[WRK_OfficeSupplies_CustomerList]
(
	   [RowNumber] INT IDENTITY (1,1),
	   [Customer_ID] VARCHAR(100),
       [City] VARCHAR(1000),
       [ZipCode] VARCHAR(5),
       [Gender] VARCHAR(1),
       [Age] FLOAT
)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_OfficeSupplies_CustomerList]

-- =============================================
-- INSERT INTO TABLE
-- =============================================
INSERT INTO [WRK_OfficeSupplies_CustomerList]
(
	   [Customer_ID],
       [City],
       [ZipCode],
       [Gender],
       [Age]
)
SELECT 
	   [Customer_ID],
       [City],
       [ZipCode],
       [Gender],
       [Age]
FROM [dbo].[RAW_OfficeSupplies_CustomerList]

END
/*
SELECT * FROM [dbo].[RAW_OfficeSupplies_CustomerList]
*/
