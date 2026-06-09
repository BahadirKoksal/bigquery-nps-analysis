-- ============================================
-- STEP 1: Data Exploration & Deduplication
-- Explore gwz_nps table and remove duplicates
-- ============================================

-- Full table preview
SELECT *
FROM course14.gwz_nps
LIMIT 10;

-- Unique orders check
SELECT DISTINCT orders_id
FROM course14.gwz_nps;

-- Full table ordered by date and orders_id
SELECT *
FROM `course14.gwz_nps`
ORDER BY date_date DESC, orders_id DESC;

-- Remove duplicates using SELECT DISTINCT
CREATE OR REPLACE TABLE course14.gwz_nps_deduplicated AS
SELECT DISTINCT *
FROM `course14.gwz_nps`
ORDER BY date_date DESC, orders_id DESC;
