# Healthcare Market Intelligence & Value-Based Care Analysis

## 🎯 Project Overview
This project identifies strategic growth opportunities for healthcare systems by analyzing **Medicare Value-Based Care (VBC)** metrics and **Market Saturation**. By cross-referencing hospital quality ratings with financial efficiency, this analysis identifies competitive "Care Deserts" and high-value targets for health system expansion.

## 🛠️ Tech Stack
- **Database Engine:** SQL Server 2025
- **IDE:** SQL Server Management Studio (SSMS) 22
- **ETL Engine:** SSMS "Import Flat File" (PROSE Logic)
- **Visualization:** Power BI Desktop
- **Documentation:** VS Code & GitHub
- **Data Source:** CMS Provider Data Catalog (Official Federal Datasets)

## 📊 Business Insights & Use Cases
- **Competitive Patient Capture:** Identifying "High-Spend, Low-Quality" clusters. Facilities in the bottom-right quadrant (Spending > 1.1, Star Rating ≤ 2) represent primary targets for patient redirection to higher-value network partners.
- **Network Adequacy:** Utilizing jittered density views to identify regions where 4 and 5-star facilities are under-represented, signaling "Care Deserts" for high-value clinical outcomes.
- **Reimbursement Optimization:** The **1.0 National Average** benchmark reveals opportunities for clinical workflow standardization in facilities where spending exceeds the norm without a corresponding lift in quality ratings.

---

## 🛠️ Technical Implementation Log

### Phase 1: Data Ingestion & Schema Enforcement
**Status:** Completed ✅

Established the "Silver" layer of the data warehouse by ingesting raw federal datasets. This phase required overcoming significant formatting anomalies inherent in CMS source files.

#### **Technical Challenges & Solutions:**

- **The "Internal Comma" & Data Shifting Issue:**
  - **Problem:** Many facility names and addresses contain internal commas, causing data to shift across columns during standard imports.
  - **Solution:** Leveraged the **SSMS "Import Flat File"** tool and PROSE logic engine to correctly identify quoted identifiers, ensuring 100% row alignment.

- **Data Loss & Truncation (The 27,530 Cell Error):**
  - **Problem:** Initial import attempts using strict numeric types caused SQL to drop over 27,000 cells due to text strings in numeric columns.
  - **Solution:** Implemented a **"Silver Schema"** strategy, manually overriding data types to `nvarchar` to ensure zero data loss during the initial load.

---

### Phase 2: Semantic Layer & Business Intelligence
**Status:** Completed ✅

Built a "Semantic Layer" using SQL Views to translate raw technical tables into actionable business insights.

#### **Technical Implementation: The "VBC Performance" Model**
- **Milestone:** Engineered the `View_HighCost_LowQuality_Facilities` semantic layer.
- **Data Transformation Logic:** - **Dynamic Type Casting:** Leveraged `TRY_CAST` to safely convert strings into `INT` and `FLOAT` formats.
    - **Relational Integrity:** Implemented an **Inner Join** on `Facility_ID` to synchronize the 38-column General Info dataset with Medicare Spending metrics.

---

### Phase 3: Visual Dashboard Construction & Jitter Logic
**Status:** Completed ✅

Developed a high-fidelity Power BI dashboard to visualize the correlation between hospital financial efficiency and clinical quality.

#### **Technical Challenges & Solutions:**
- **The "Overplotting" Obstacle:** - **Problem:** Discrete integer Star Ratings caused 5,000+ data points to stack into five flat lines.
  - **Solution:** Implemented **Statistical Jittering** via DAX to create "data clouds" for better distribution analysis.
  - **Formula:** `Jittered Star Rating = MAX(Star_Rating) + (RAND() - 0.5) * 0.2`

---

### Phase 4: Interactivity & UI Optimization
**Status:** Completed ✅

- **UI/UX Design:** Implemented a high-contrast theme and optimized visual layouts for professional audit presentations.
- **Regional Analysis:** Engineered a **Multi-Select State Slicer** with fixed axis scales to allow for fair regional comparative analysis.

---

### Phase 5: Clinical-Financial Integration & UI Standardization
**Status:** Completed ✅

The final phase unified clinical outcomes with financial efficiency data and standardized the user interface for executive-level delivery.

#### **Technical Implementation:**
- **Unified Semantic Layer:** Engineered `04_Value_Matrix_Dashboard_Source.sql` to join clinical views with Medicare spending data, creating a triple-axis model (Cost, Quality, and Outcomes).
- **Executive Header Engineering:** Developed a standardized "Control Bar" featuring three custom DAX measures for real-time market benchmarking:
    - **Market Scale:** `DISTINCTCOUNT(Facility_ID)`
    - **Market Quality:** `AVERAGE(Star_Rating)`
    - **Efficiency Benchmark:** `AVERAGE(Medicare_Spending_Score)`

#### **UI/UX Standardization (The "LLC Standard"):**
- **Canvas Synchronization:** Unified all dashboard widths to **1500px** to ensure a seamless, professional transition when embedded in the web portfolio.
- **Brand Identity:** Applied a global "Dunleavy Analytics" theme utilizing a Navy/Grey/White high-contrast palette and dark wavy visual anchors.
- **Enhanced Readability:** Configured dual-slicer logic (State and Ownership) and stabilized Analytics Pane benchmarks with "Horizontal: Right" data labeling.

---

### 📊 Business Insights & Strategic Findings
1. **Ownership Efficiency Gap:** Non-Profit facilities show tighter clustering around the $1.0$ spending mark with higher median Star Ratings compared to many For-Profit counterparts.
2. **Spending/Quality Decoupling:** In high-spending regions (Spending Score > 1.2), there is a lack of statistically significant correlation with a 5-star rating lift.
3. **Care Deserts:** Identified geographic "Value Voids" where national spending exceeds the mean but clinical outcomes (Mortality/Readmission) remain in the bottom 20th percentile.

---
*Developed by Sean Dunleavy | Principal Data Engineer, Dunleavy Analytics*