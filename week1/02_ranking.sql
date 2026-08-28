-- W1.2 Ranking per kategori
-- ROW_NUMBER: no tie, urutan unik
-- RANK: tie mendapat nilai sama, lompat (1,1,3)
-- DENSE_RANK: tie nilai sama, tidak lompat (1,1,2)
SELECT
  product_id,
  category,
  sale_price,
  ROW_NUMBER() OVER (PARTITION BY category ORDER BY sale_price DESC) AS rn,
  RANK()       OVER (PARTITION BY category ORDER BY sale_price DESC) AS rk,
  DENSE_RANK() OVER (PARTITION BY category ORDER BY sale_price DESC) AS drk
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 1000;
