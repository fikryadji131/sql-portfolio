-- W1.3 Running total & moving average 7 hari
-- Gunakan tabel agregat harian (CTE) lalu window
WITH daily AS (
  SELECT
    DATE(created_at) AS order_date,
    SUM(sale_price) AS daily_sales
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY 1
)
SELECT
  order_date,
  daily_sales,
  SUM(daily_sales) OVER (
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total,
  AVG(daily_sales) OVER (
    ORDER BY order_date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS ma_7d
FROM daily
ORDER BY order_date;
