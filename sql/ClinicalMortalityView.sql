/* Name: ClinicalMortalityView
Purpose: Standardizes hospital mortality rates and joins with anchor facility info.
Logic: Uses TRY_CAST to handle 'Not Available' strings and ensures Facility_ID joins correctly.
*/

CREATE OR ALTER VIEW ClinicalMortalityView AS
SELECT 
    H.Facility_ID, 
    H.Facility_Name,
    H.State,
    M.Measure_Name,
    TRY_CAST(M.Score AS FLOAT) AS Mortality_Rate,
    M.Start_Date,
    M.End_Date
FROM [dbo].[Raw_Hospital_General_Info] H
JOIN [dbo].[Complications_and_Deaths_Hospital] M ON H.Facility_ID = M.Facility_ID
WHERE TRY_CAST(M.Score AS FLOAT) IS NOT NULL;
GO