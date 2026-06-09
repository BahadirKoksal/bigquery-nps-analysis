-- ============================================
-- STEP 5: Transporter Deep Dive (Chrono Home)
-- Compare NPS performance by transporter
-- across June and August 2021
-- ============================================

-- Chrono Home - June 2021 all responses
SELECT *
FROM `course14.gwz_nps_calculated`
WHERE TRUE
  AND nps IS NOT NULL
  AND date_date BETWEEN '2021-06-01' AND '2021-06-30'
  AND transporter = 'Chrono Home';

-- Chrono Home - June 2021 promoters (59)
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = 1
AND date_date BETWEEN '2021-06-01' AND '2021-06-30'
AND transporter = 'Chrono Home';

-- Chrono Home - June 2021 detractors (5)
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = -1
AND date_date BETWEEN '2021-06-01' AND '2021-06-30'
AND transporter = 'Chrono Home';

-- Chrono Home June NPS = (59 - 5) / 87 * 100 = 62
SELECT ROUND((59 - 5) / 87 * 100, 1) AS chrono_home_june_nps;

-- Chrono Home - August 2021 all responses
SELECT *
FROM `course14.gwz_nps_calculated` t
WHERE TRUE
  AND date_date BETWEEN '2021-08-01' AND '2021-08-31'
  AND transporter = 'Chrono Home';

-- Chrono Home - August 2021 promoters (33)
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = 1
AND date_date BETWEEN '2021-08-01' AND '2021-08-31'
AND transporter = 'Chrono Home';

-- Chrono Home - August 2021 detractors (13)
SELECT *
FROM course14.gwz_nps_calculated
WHERE TRUE
AND nps = -1
AND date_date BETWEEN '2021-08-01' AND '2021-08-31'
AND transporter = 'Chrono Home';

-- Chrono Home August NPS = (33 - 13) / 57 * 100 = 35
SELECT ROUND((33 - 13) / 57 * 100, 1) AS chrono_home_august_nps;

-- Most dissatisfied frequent customers
-- Detractors OR low delivery satisfaction
SELECT *
FROM `course14.gwz_nps_calculated` t
WHERE TRUE
  AND date_date BETWEEN '2021-08-01' AND '2021-08-31'
  AND transporter = 'Chrono Home'
  AND (nps = -1 OR csat_delivery <= 3)
ORDER BY sgt;
