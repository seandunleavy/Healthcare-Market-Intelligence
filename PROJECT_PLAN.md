# Project Roadmap: Healthcare Market Intelligence

## Phase 1: Data Acquisition & Ingestion ✅
- [x] Source CMS Hospital General Information CSV
- [x] Source CMS Medicare Spending per Beneficiary CSV
- [x] Solve "Internal Comma" shift in Facility Names
- [x] Enforce `nvarchar` schema to prevent 27k+ cell data loss
- [x] Rename tables for T-SQL compatibility (Snake_Case)

## Phase 2: Data Modeling & Semantic Layer 🏗️
- [x] Create `View_HighCost_LowQuality_Facilities` (The "VBC" Model)
- [x]  Perform Data Profiling (Check for NULLs and Duplicates)
- [x] Create `View_State_Market_Summary` (Aggregated Performance)
- [ ] Create `View_Care_Desert_Identification` (Low Provider Density regions)

## Phase 3: Market Analysis & Insights
- [ ] Identify Top 5 "Expansion Ready" States
- [ ] Analyze correlation between Hospital Ownership and Spending Scores
- [ ] Draft Executive Summary of findings

## Phase 4: Data Visualization & Delivery
- [ ] Connect SQL Views to Power BI / Tableau
- [ ] Build Geographic Heat Map of Hospital Ratings
- [ ] Finalize Portfolio Documentation & GitHub Readme