/* Name: 04_Value_Matrix_Dashboard_Source
Purpose: Primary data source for the Value Matrix Dashboard.
Logic: Joins ClinicalMortalityView with Medicare Spending. 
       Maintains full national dataset for flexible filtering in Power BI.
*/

USE [Healthcare_Market_Intelligence];
GO

CREATE OR ALTER VIEW View_Value_Matrix_Dashboard AS
SELECT 
    Q.Facility_ID,
    Q.Facility_Name,
    Q.State,
    Q.Mortality_Rate,
    S.Score AS Spending_Score,
    -- (Mortality * Spending) = Value Index
    (Q.Mortality_Rate * TRY_CAST(S.Score AS FLOAT)) AS Value_Index,
    Q.Start_Date,
    Q.End_Date
FROM ClinicalMortalityView Q
JOIN dbo.Raw_Medicare_Spending S ON Q.Facility_ID = S.Facility_ID;
GO