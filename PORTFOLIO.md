# Healthcare Market Intelligence — Portfolio Case Study

**Project:** CMS hospital quality + Medicare spending analysis for value-based care / market expansion insights  
**Role:** Solo analyst/developer (SQL Server, semantic views, Power BI, documentation)  
**Timeline:** ~Feb 2026 (v1.0 release)  
**Repository:** Public — [github.com/seandunleavy/Healthcare-Market-Intelligence](https://github.com/seandunleavy/Healthcare-Market-Intelligence)  
**Local:** `C:\Users\seand\GitProjects\Healthcare-Market-Intelligence`

---

## Problem & Goals

**Problem:** Health systems need a clear view of where quality and cost diverge — “high spend, low quality” facilities and geographic gaps — using official CMS data rather than anecdotes.

**Goals:**

1. Ingest CMS hospital general information + Medicare spending (and later mortality/readmission) into SQL Server  
2. Build semantic SQL views for VBC-style targeting  
3. Deliver Power BI dashboards (value matrix + market intelligence) with professional branding  
4. Document challenges (CSV commas, type truncation, overplotting) for portfolio honesty  

---

## Architecture

```
CMS Provider Data Catalog (CSV)
        │
        ▼
SQL Server (SSMS Import Flat File / silver nvarchar load)
        │
        ▼
Semantic views (T-SQL)
  - High cost / low quality
  - State market summary
  - Clinical mortality / readmission
  - Master PBI source views
        │
        ▼
Power BI (.pbix)
  Healthcare Value Matrix + Market Intelligence suite (1500px branded)
```

---

## Tech Stack

| Layer | Choice | Why |
|-------|--------|-----|
| Warehouse | SQL Server | Microsoft BI path; strong for views + PBI |
| Ingest | SSMS Import Flat File | Handle messy CMS CSV quoting |
| Semantics | T-SQL views | TRY_CAST, joins on Facility_ID |
| Viz | Power BI | Executive dashboards, slicers, DAX jitter |
| Source | CMS federal datasets | Authoritative public health data |

---

## Phases Completed (Journal)

| Phase | Goal | Status |
|-------|------|--------|
| **1** | Ingestion & silver schema | ✅ |
| **2** | Semantic VBC views | ✅ |
| **3** | Power BI + DAX jitter | ✅ |
| **4** | Market findings / expansion states | ✅ |
| **5** | Clinical-financial integration + 1500px UI | ✅ |
| **6** | Portfolio package on GitHub | ✅ |

---

## Challenges Solved

### 1. Internal commas shifting CSV columns  
**Fix:** SSMS Import Flat File / PROSE quoted identifiers.

### 2. 27k+ cells dropped on strict numeric import  
**Fix:** Silver `nvarchar` load, then safe `TRY_CAST` in views.

### 3. Star-rating overplotting in scatter visuals  
**Fix:** DAX statistical jitter on star rating.

### 4. Brand / theme consistency across suite  
**Fix:** 1500px canvas standard, Dunleavy navy/grey palette, shared control bar measures.

---

## Artifacts

| Type | Examples |
|------|----------|
| SQL | `sql/` scripts, master PBI views |
| Reports | Value Matrix + Market Intelligence `.pbix` (see repo) |
| Plan | `PROJECT_PLAN.md` (roadmap + Feb 2026 release notes) |

---

## What's Next (Honest)

| Priority | Item |
|----------|------|
| Optional | Power BI Service public embed if capacity/license allows |
| Optional | Link from dunleavyorganization.com project page |
| Not planned | Real-time CMS API pipeline (batch CSV was correct for this case study) |

**Status:** Complete portfolio case study — maintenance only unless user reopens.

---

## Skills Demonstrated

- CMS / healthcare public data wrangling  
- SQL Server modeling and semantic layers  
- Power BI executive dashboards and DAX  
- Problem-solving under dirty federal file formats  
- Portfolio documentation for consulting/hiring  

*No secrets or private patient data — public CMS sources only.*
