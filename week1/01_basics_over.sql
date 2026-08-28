-- W1.1 Dasar OVER() vs GROUP BY
-- Window function: agregat tapi baris tetap utuh (bisa banding row-level vs total)
SELECT
  order_id,
  product_id,
  sale_price,
  SUM(sale_price) OVER (PARTITION BY order_id) AS total_order_value
FROM `bigquery-public-data.thelook_ecommerce.order_items`
LIMIT 1000;
