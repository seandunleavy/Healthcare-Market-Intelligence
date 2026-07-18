# Healthcare Market Intelligence — Project Plan

**Last updated:** 2026-07-18 (moved to GitProjects; portfolio standard)  
**Status:** **Complete** — portfolio case study  
**Repo:** [github.com/seandunleavy/Healthcare-Market-Intelligence](https://github.com/seandunleavy/Healthcare-Market-Intelligence)  
**Local:** `C:\Users\seand\GitProjects\Healthcare-Market-Intelligence`  
**Case study:** [`PORTFOLIO.md`](PORTFOLIO.md)

---

## YOU ARE HERE

```
STATUS:   V1.0 released Feb 2026; docs aligned July 2026
PRODUCT:  Complete SQL + Power BI suite on CMS data
NEXT:     Optional PBI embed / site link only if user asks
```

---

## Phase 1: Data Acquisition & Ingestion ✅
- [x] Source CMS Hospital General Information CSV
- [x] Source CMS Medicare Spending per Beneficiary CSV
- [x] Solve "Internal Comma" shift in Facility Names
- [x] Enforce `nvarchar` schema to prevent 27k+ cell data loss
- [x] Rename tables for T-SQL compatibility (Snake_Case)

## Phase 2: Data Modeling & Semantic Layer ✅
- [x] Create `View_HighCost_LowQuality_Facilities` (The "VBC" Model)
- [x] Perform Data Profiling (Check for NULLs and Duplicates)
- [x] Create `View_State_Market_Summary` (Aggregated Performance)

## Phase 3: Visual Dashboard Construction (Business View) ✅
- [x] Connect SQL Views to Power BI
- [x] Implement **DAX Jitter Logic** to resolve Star Rating overplotting
- [x] Build Multi-Select State Slicers for regional comparative analysis
- [x] Finalize Portfolio Documentation & Initial GitHub Push

## Phase 4: Market Analysis & Strategic Findings ✅
- [x] Identify Top 5 "Expansion Ready" States using the visual model
- [x] Analyze correlation between Hospital Ownership (Non-Profit vs. For-Profit) and Spending Scores
- [x] Draft Executive Summary of findings for stakeholder review

## Phase 5: Clinical Outcomes & Value Integration ✅
- [x] **Data Ingestion:** Import Mortality and Readmission CSVs into SQL Server
- [x] **Clinical Semantic Layer:** Engineer `ClinicalMortalityView` and `ClinicalReadmissionView`
- [x] **Executive Dashboard Construction:**
    - [x] Build **KPI Ribbon** for national/regional clinical averages
    - [x] Create **Outcome Bubble Map** for geographic gap analysis
    - [x] Implement **Facility-Level Search/Slicer** for deep-dive analysis
- [x] **UI Standardization:** Synchronize canvas widths (1500px) and dark wavy branding across the suite
- [x] **Definition of Done:** Final GitHub Push with "Clinical-Financial Unified Model"

---

# Daily Update - February 11, 2026

### Technical Summary
* **UI Standardization:** Executed a full brand synchronization for the **Dunleavy Organization LLC** dashboard suite. Standardized all canvas widths to **1500px** to ensure seamless transition between the "Healthcare Value Matrix" and "Market Intelligence" reports.
* **Theme Fix & Branding:** Resolved a JSON naming conflict ("Tidal" vs. "Dunleavy Brand"). Re-implemented the dark wavy wallpaper and applied a high-contrast Navy/Grey/White color palette across all visual containers.
* **Analytics Layer Refinement:** Restored critical Analytics Pane features including **Constant Lines** for National Averages. Configured data labels with "Horizontal: Right" positioning and black text for maximum readability.
* **Executive Header Engineering:** Built a 1500px "Executive Control Bar" featuring three new DAX measures (`Total Facilities`, `Avg Star Rating`, `Avg Spending Index`) using the `View_PBI_Master_Hospital_Data` schema.

### Artifacts Created (Actual Filenames)
* `HEALTHCAREVALUEMATRIXPERFORMANCEDASHBOARDV2.pbix`
* `Market-Intelligence-AnalysisReport.pbix`
* `03_create_master_pbi_view.sql`
* `04_Value_Matrix_Dashboard_Source.sql`

### Next Steps (optional — not active roadmap)
* **Web Deployment:** Generate Public Embed iFrame codes from the Power BI Service (if license allows).
* **Portfolio Integration:** Optional link from dunleavyorganization.com project pages.

---

## Last session

**2026-07-18 — One-time cleanup**

- Folder moved from `C:\Users\seand\Projects\` → `C:\Users\seand\GitProjects\`  
- Added `PORTFOLIO.md` + `AGENTS.md`; plan header aligned to standard  

