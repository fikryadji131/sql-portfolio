-- W1.5 Capstone: Top 3 produk termahal per kategori + running total penjualannya
WITH ranked AS (
  SELECT
    p.category,
    p.name AS product_name,
    p.sale_price,
    ROW_NUMBER() OVER (
      PARTITION BY p.category ORDER BY p.sale_price DESC
    ) AS price_rank
  FROM `bigquery-public-data.thelook_ecommerce.products` p
)
SELECT
  category,
  product_name,
  sale_price,
  price_rank,
  SUM(sale_price) OVER (
    PARTITION BY category ORDER BY price_rank
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total_category
FROM ranked
WHERE price_rank <= 3
ORDER BY category, price_rank;
