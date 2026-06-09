-- ============================================
-- STEP 4: Time-Based NPS Analysis
-- Track NPS trends by month
-- ============================================

-- June 2021 - All responses
SELECT *
FROM `course14.gwz_nps_calculated`
WHERE TRUE
  AND nps IS NOT NULL
  AND date_date BETWEEN '2021-06-01' AND '2021-06-30';

-- June 2021 - Promoters
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = 1
AND date_date BETWEEN '2021-06-01' AND '2021-06-30';

-- June 2021 - Detractors
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = -1
AND date_date BETWEEN '2021-06-01' AND '2021-06-30';

-- June 2021 NPS = (1061 - 96) / 1441 * 100 = 67
SELECT ROUND((1061 - 96) / 1441 * 100, 1) AS june_nps;

-- August 2021 - All responses
SELECT *
FROM `course14.gwz_nps_calculated`
WHERE TRUE
  AND nps IS NOT NULL
  AND date_date BETWEEN '2021-08-01' AND '2021-08-31';

-- August 2021 - Promoters
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = 1
AND date_date BETWEEN '2021-08-01' AND '2021-08-31';

-- August 2021 - Detractors
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = -1
AND date_date BETWEEN '2021-08-01' AND '2021-08-31';

-- August 2021 NPS = (902 - 104) / 1269 * 100 = 63
SELECT ROUND((902 - 104) / 1269 * 100, 1) AS august_nps;
