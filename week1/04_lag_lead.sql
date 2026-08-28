-- W1.4 LAG / LEAD: banding periode sebelum/sesudah
WITH monthly AS (
  SELECT
    DATE_TRUNC(DATE(created_at), MONTH) AS bulan,
    SUM(sale_price) AS sales
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY 1
)
SELECT
  bulan,
  sales,
  LAG(sales, 1)  OVER (ORDER BY bulan) AS sales_bulan_lalu,
  sales - LAG(sales, 1) OVER (ORDER BY bulan) AS selisih,
  LEAD(sales, 1) OVER (ORDER BY bulan) AS sales_bulan_depan
FROM monthly
ORDER BY bulan;
