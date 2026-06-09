-- ============================================
-- STEP 2: NPS Score Calculation
-- Classify each response as Promoter, Passive
-- or Detractor using CASE WHEN logic
-- ============================================

-- Calculate NPS score per response
CREATE OR REPLACE TABLE course14.gwz_nps_calculated AS
SELECT
  date_date,
  orders_id,
  transporter,
  sgt,
  global_note,
  CASE
    WHEN global_note IN (9,10) THEN 1
    WHEN global_note IN (7,8) THEN 0
    WHEN global_note BETWEEN 0 AND 6 THEN -1
  END AS nps,
  csat_website,
  csat_product,
  csat_price,
  csat_delivery
FROM `course14.gwz_nps_deduplicated`;

-- Preview calculated scores
SELECT *
FROM `course14.gwz_nps_calculated`
WHERE nps IS NOT NULL;

-- Promoters only
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = 1;

-- Detractors only
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = -1;

-- Passives only
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = 0;
