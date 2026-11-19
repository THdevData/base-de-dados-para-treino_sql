-- 1. Receita recebida por mes.
SELECT
    DATE_TRUNC('month', p.payment_date)::DATE AS month,
    SUM(p.amount)::NUMERIC(12, 2) AS revenue_received
FROM sales.payments AS p
JOIN sales.orders AS o ON o.order_id = p.order_id
WHERE p.status = 'paid'
  AND o.status <> 'cancelled'
GROUP BY DATE_TRUNC('month', p.payment_date)
ORDER BY month;

-- 2. Produtos mais vendidos em pedidos nao cancelados.
SELECT
    p.sku,
    p.name AS product,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price)::NUMERIC(12, 2) AS gross_sales
FROM sales.order_items AS oi
JOIN sales.products AS p ON p.product_id = oi.product_id
JOIN sales.orders AS o ON o.order_id = oi.order_id
WHERE o.status <> 'cancelled'
GROUP BY p.product_id, p.sku, p.name
ORDER BY units_sold DESC, gross_sales DESC
LIMIT 10;

-- 3. Valor de pedidos por pessoa responsavel.
SELECT
    e.full_name AS sales_rep,
    COUNT(*) AS order_count,
    SUM(v.total_amount)::NUMERIC(12, 2) AS sales_amount
FROM sales.v_order_summary AS v
JOIN sales.employees AS e ON e.employee_id = v.employee_id
WHERE v.status <> 'cancelled'
GROUP BY e.employee_id, e.full_name
ORDER BY sales_amount DESC;

-- 4. Pedidos que ainda possuem saldo a receber.
SELECT
    v.order_id,
    c.company_name AS customer,
    v.status,
    v.total_amount,
    v.amount_paid,
    v.balance_due
FROM sales.v_order_summary AS v
JOIN sales.customers AS c ON c.customer_id = v.customer_id
WHERE v.status <> 'cancelled'
  AND v.balance_due > 0
ORDER BY v.order_date;

-- 5. Clientes com maior valor vendido.
SELECT
    c.company_name AS customer,
    COUNT(*) AS order_count,
    SUM(v.total_amount)::NUMERIC(12, 2) AS sales_amount
FROM sales.v_order_summary AS v
JOIN sales.customers AS c ON c.customer_id = v.customer_id
WHERE v.status <> 'cancelled'
GROUP BY c.customer_id, c.company_name
ORDER BY sales_amount DESC
LIMIT 10;
