-- ============================================
-- STEP 3: Overall NPS Score
-- Calculate the final NPS score
-- Promoters: 4,524 | Detractors: 459 | Total: 6,253
-- ============================================

-- Overall NPS calculation
SELECT
  ROUND((4524 - 459) / 6253 * 100, 1);

-- NPS distribution summary
SELECT
  nps,
  COUNT(*) AS count,
  ROUND(COUNT(*) / 6253 * 100, 1) AS pct
FROM course14.gwz_nps_calculated
WHERE nps IS NOT NULL
GROUP BY nps
ORDER BY nps DESC;
