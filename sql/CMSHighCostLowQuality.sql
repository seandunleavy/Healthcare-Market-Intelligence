SELECT 
    G.[Facility_Name], 
    G.[State], 
    G.[Hospital_overall_rating], 
    S.[Score] AS [Medicare_Spending_Score]
FROM [dbo].[Raw_Hospital_General_Info] G
JOIN [dbo].[Raw_Medicare_Spending] S 
    ON G.[Facility_ID] = S.[Facility_ID]
WHERE TRY_CAST(G.[Hospital_overall_rating] AS INT) <= 2
  AND TRY_CAST(S.[Score] AS FLOAT) > 1.0
ORDER BY S.[Score] DESC;