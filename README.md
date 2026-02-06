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
  - **Problem:** Many facility names and addresses contain internal commas. The standard SSMS Import/Export Wizard failed to respect double-quote qualifiers, causing data to shift across columns and corrupting over 5,000 rows.
  - **Solution:** Leveraged the **SSMS "Import Flat File"** tool and PROSE logic engine to correctly identify quoted identifiers, ensuring 100% row alignment.

- **Data Loss & Truncation (The 27,530 Cell Error):**
  - **Problem:** CMS data often contains text strings (e.g., "Not Available") in numeric columns. Initial import attempts using integer types caused SQL to drop over 27,000 cells of data.
  - **Solution:** Implemented a **"Silver Schema"** strategy, manually overriding data types to `nvarchar` to ensure zero data loss during the initial load.

- **Data Fidelity (Leading Zeros):**
  - **Problem:** ZIP Codes and Facility IDs (CCNs) starting with zero were being stripped by automated type detection.
  - **Solution:** Enforced `nvarchar` typing on all identity and location fields to maintain data integrity.

---

### Phase 2: Semantic Layer & Business Intelligence
**Status:** Completed ✅

Built a "Semantic Layer" using SQL Views to translate raw technical tables into actionable business insights for Value-Based Care (VBC) stakeholders.

#### **Technical Implementation: The "VBC Performance" Model**
- **Milestone:** Engineered the `View_HighCost_LowQuality_Facilities` semantic layer.
- **Data Transformation Logic:** - **Dynamic Type Casting:** Leveraged `TRY_CAST` to safely convert strings into `INT` and `FLOAT` formats for mathematical comparison.
    - **Relational Integrity:** Implemented an **Inner Join** on `Facility_ID` to synchronize the 38-column General Info dataset with Medicare Spending metrics.
- **Business Logic:** Defined "Market Intervention" targets as facilities with a **Star Rating ≤ 2** and a **Medicare Spending Score > 1.0**.

---

### Phase 3: Visual Dashboard Construction & Jitter Logic
**Status:** Completed ✅

Developed a high-fidelity Power BI dashboard to visualize the correlation between hospital financial efficiency and clinical quality.

#### **Technical Challenges & Solutions:**
- **The "Overplotting" Obstacle:** - **Problem:** CMS Star Ratings are discrete integers (1-5), causing 5,000+ data points to stack into five flat lines, hiding density.
  - **Solution:** Implemented **Statistical Jittering** via DAX to create "data clouds" for better distribution analysis.
  - **Formula:** `Jittered Star Rating = MAX(Star_Rating) + (RAND() - 0.5) * 0.2`
- **Visual Benchmarking:** Integrated a vertical **Constant Line** at $1.0$ on the X-axis (National Spending Average) to distinguish between efficiency leaders and outliers.

---

### Phase 4: Interactivity & UI Optimization
**Status:** Completed ✅

- **UI/UX Design:** Implemented a high-contrast theme and optimized visual layouts for professional audit presentations.
- **Regional Analysis:** Engineered a **Multi-Select State Slicer** with fixed axis scales to allow for fair regional comparative analysis and consistent data storytelling.

---

### Phase 5: VBC Market Intelligence Findings
**Status:** Analysis Active 📈

Initial analysis of the visual model reveals:
1. **Ownership Efficiency Gap:** Non-Profit facilities show tighter clustering around the $1.0$ spending mark with higher median Star Ratings compared to many For-Profit counterparts.
2. **Spending/Quality Decoupling:** In high-spending regions (X-axis > 1.2), there is a lack of statistically significant correlation with a 5-star rating lift, suggesting diminishing returns on Medicare spending per beneficiary in unoptimized systems.

---
*Developed by Sean Dunleavy | Principal Data Engineer, Dunleavy Analytics*