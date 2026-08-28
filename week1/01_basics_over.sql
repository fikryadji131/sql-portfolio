-- W1.1 Dasar OVER() vs GROUP BY
-- Window function: agregat tapi baris tetap utuh (bisa banding row-level vs total)
-- Asumsi: tabel 'superstore' sudah di-load ke PostgreSQL via DBeaver
SELECT
  "Order ID",
  "Product Name",
  "Sales",
  SUM("Sales") OVER (PARTITION BY "Order ID") AS total_order_value
FROM superstore
LIMIT 1000;
