/* Name: ClinicalReadmissionView
Purpose: Separates mixed units (Percentages vs Days) in the readmission dataset.
Logic: Uses a CASE statement to label 'Score_Unit' so Power BI can filter out negative 'Day' values.
*/

CREATE OR ALTER VIEW ClinicalReadmissionView AS
SELECT 
    H.Facility_ID,
    H.Facility_Name,
    H.State,
    R.Measure_Name,
    TRY_CAST(R.Score AS FLOAT) AS Performance_Score,
    CASE 
        WHEN R.Measure_Name LIKE '%rate%' THEN 'Percentage'
        WHEN R.Measure_Name LIKE '%day%'  THEN 'Days'
        ELSE 'Other'
    END AS Score_Unit,
    R.Start_Date,
    R.End_Date
FROM [dbo].[Raw_Hospital_General_Info] H
JOIN [dbo].[Unplanned_Hospital_Visits_Hospital] R ON H.Facility_ID = R.Facility_ID
WHERE TRY_CAST(R.Score AS FLOAT) IS NOT NULL;
GO