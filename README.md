# ⭐ BigQuery NPS Analysis

## 📌 Project Overview
This project analyzes customer satisfaction data using BigQuery SQL. Using Net Promoter Score (NPS) methodology, we score and segment customers, track satisfaction trends over time, and identify underperforming transporter segments to support data-driven CRM decisions.

---

## 🎯 Business Context
NPS is a key CRM metric used to:
- Measure overall customer loyalty
- Identify at-risk customers (detractors) before churn
- Track satisfaction trends by time period and delivery partner

---

## 🗃️ Dataset
- Platform: Google BigQuery
- Dataset: course14
- Table: gwz_nps
- Columns: date_date, global_note, csat_website, csat_product, csat_price, csat_delivery, orders_id, transporter, sgt

### Customer Segments (sgt)
- new — first-time customers
- occasional — infrequent buyers
- frequent — loyal, repeat customers

---

## 🔄 Analysis Steps

### Step 1 — Data Exploration & Deduplication
- Explored gwz_nps table: 6,295 rows, 1 duplicate detected
- Removed duplicate using SELECT DISTINCT → gwz_nps_deduplicated
- Filtered 41 rows with NULL global_note → 6,253 valid records

### Step 2 — NPS Score Calculation
Applied CASE WHEN logic to classify each response:
- global_note 9-10 → Promoter (1)
- global_note 7-8 → Passive (0)
- global_note 0-6 → Detractor (-1)

Saved results to gwz_nps_calculated

### Step 3 — Overall NPS Score
- Promoters: 4,524 (72%)
- Passives: 1,270 (20%)
- Detractors: 459 (7%)
- Overall NPS = (4524 - 459) / 6253 × 100 = 65

### Step 4 — Time-Based Analysis
- June 2021: 1,441 responses → NPS ≈ 67
- August 2021: 1,269 responses → NPS ≈ 63
- Slight downward trend detected

### Step 5 — Transporter Deep Dive (Chrono Home)
- June 2021: NPS ≈ 62 (normal performance)
- August 2021: NPS ≈ 35 (significant drop)
- Most affected segment: frequent customers with csat_delivery <= 3

---

## 📊 Key Findings
- ✅ Overall NPS = 65 — excellent score for e-commerce
- 📉 NPS dropped from 67 (June) to 63 (August) — worth monitoring
- 🚨 Chrono Home NPS dropped from 62 to 35 in August — critical issue
- ⚠️ Most dissatisfied group: frequent (loyal) customers — churn risk
- 🔍 1 duplicate and 41 NULL scores detected and cleaned before analysis

---

## 🛠️ Tech Stack
- Google BigQuery (SQL)
- Techniques: CASE WHEN, SELECT DISTINCT, BETWEEN date filtering, NPS calculation, segment analysis

---

## 📁 Repository Structure
- README.md
- queries/
  - 1_data_exploration.sql
  - 2_nps_score_calculation.sql
  - 3_overall_nps.sql
  - 4_time_based_analysis.sql
  - 5_transporter_analysis.sql

---

