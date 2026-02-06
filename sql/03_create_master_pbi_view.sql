USE [Healthcare_Market_Intelligence]
GO

/****** Object:  View [dbo].[View_PBI_Master_Hospital_Data]    Script Date: 2/5/2026 12:40:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[View_PBI_Master_Hospital_Data] AS
SELECT 
    G.[Facility_ID],
    G.[Facility_Name],
    G.[Address],
    G.[City_Town],
    G.[State],
    G.[ZIP_Code],
    G.[County_Parish], -- Corrected from County_Name
    G.[Hospital_Type],
    G.[Hospital_Ownership],
    G.[Emergency_Services],
    -- Cleaning the ratings for Power BI math
    TRY_CAST(G.[Hospital_overall_rating] AS INT) AS [Star_Rating],
    TRY_CAST(S.[Score] AS FLOAT) AS [Medicare_Spending_Score],
    S.[Start_Date],
    S.[End_Date],
    -- A quick flag to help you find targets in Power BI without complex filters
    CASE 
        WHEN TRY_CAST(S.[Score] AS FLOAT) > 1.0 AND TRY_CAST(G.[Hospital_overall_rating] AS INT) <= 2 THEN 1 
        ELSE 0 
    END AS [Is_High_Opportunity_Target]
FROM [dbo].[Raw_Hospital_General_Info] G
LEFT JOIN [dbo].[Raw_Medicare_Spending] S ON G.[Facility_ID] = S.[Facility_ID];
GO


