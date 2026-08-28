-- W1.2 Ranking per kategori
-- ROW_NUMBER: no tie, urutan unik
-- RANK: tie mendapat nilai sama, lompat (1,1,3)
-- DENSE_RANK: tie nilai sama, tidak lompat (1,1,2)
SELECT
  "Category",
  "Sub-Category",
  "Product Name",
  "Sales",
  ROW_NUMBER() OVER (PARTITION BY "Category" ORDER BY "Sales" DESC) AS rn,
  RANK()       OVER (PARTITION BY "Category" ORDER BY "Sales" DESC) AS rk,
  DENSE_RANK() OVER (PARTITION BY "Category" ORDER BY "Sales" DESC) AS drk
FROM superstore
LIMIT 1000;
