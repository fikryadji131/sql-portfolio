-- W1.5 Capstone: Top 3 produk termahal per kategori + running total penjualannya
WITH ranked AS (
  SELECT
    "Category",
    "Product Name",
    "Sales",
    ROW_NUMBER() OVER (PARTITION BY "Category" ORDER BY "Sales" DESC) AS sales_rank
  FROM superstore
)
SELECT
  "Category",
  "Product Name",
  "Sales",
  sales_rank,
  SUM("Sales") OVER (
    PARTITION BY "Category" ORDER BY sales_rank
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total_category
FROM ranked
WHERE sales_rank <= 3
ORDER BY "Category", sales_rank;
