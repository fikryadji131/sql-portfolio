-- W1.3 Running total & moving average 7 hari
-- Pastikan "Order Date" bertipe DATE saat import di DBeaver
WITH daily AS (
  SELECT
    DATE_TRUNC('day', "Order Date")::date AS order_date,
    SUM("Sales") AS daily_sales
  FROM superstore
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
