INSERT INTO sales.departments (department_id, name) VALUES
    (1, 'Vendas'),
    (2, 'Operacoes'),
    (3, 'Financeiro');

INSERT INTO sales.employees
    (employee_id, department_id, full_name, email, hire_date, salary)
VALUES
    (1, 1, 'Marina Costa', 'marina.costa@empresa.example', '2022-03-14', 7200.00),
    (2, 1, 'Rafael Lima', 'rafael.lima@empresa.example', '2023-01-09', 5400.00),
    (3, 1, 'Camila Souza', 'camila.souza@empresa.example', '2023-08-21', 5200.00),
    (4, 2, 'Bruno Alves', 'bruno.alves@empresa.example', '2024-02-05', 4800.00);

INSERT INTO sales.customers
    (customer_id, company_name, contact_name, email, phone, city, state, created_at)
VALUES
    (1, 'Aurora Papelaria', 'Ana Martins', 'ana@aurorapapelaria.example', '11990001001', 'Sao Paulo', 'SP', '2024-11-02'),
    (2, 'Horizonte Coworking', 'Pedro Nunes', 'pedro@horizonte.example', '11990001002', 'Sao Paulo', 'SP', '2024-11-15'),
    (3, 'Verde Vivo Alimentos', 'Luiza Rocha', 'luiza@verdevivo.example', '31990001003', 'Belo Horizonte', 'MG', '2024-12-01'),
    (4, 'Norte Design', 'Caio Mendes', 'caio@nortedesign.example', '41990001004', 'Curitiba', 'PR', '2024-12-12'),
    (5, 'Atelie Central', 'Bianca Reis', 'bianca@ateliecentral.example', '11990001005', 'Sao Paulo', 'SP', '2025-01-10'),
    (6, 'Ponto de Leitura', 'Joao Freitas', 'joao@pontoleitura.example', '51990001006', 'Porto Alegre', 'RS', '2025-01-19'),
    (7, 'Estacao Criativa', 'Lara Campos', 'lara@estacaocriativa.example', '21990001007', 'Rio de Janeiro', 'RJ', '2025-02-11'),
    (8, 'Oficina Horizonte', 'Diego Barros', 'diego@oficinahorizonte.example', '31990001008', 'Belo Horizonte', 'MG', '2025-02-24');

INSERT INTO sales.categories (category_id, name) VALUES
    (1, 'Escritorio'),
    (2, 'Informatica'),
    (3, 'Organizacao'),
    (4, 'Mobiliario');

INSERT INTO sales.products
    (product_id, category_id, sku, name, unit_price)
VALUES
    (1, 1, 'ESC-001', 'Caderno executivo', 38.90),
    (2, 1, 'ESC-002', 'Kit de canetas premium', 24.50),
    (3, 2, 'INF-001', 'Mouse sem fio', 89.90),
    (4, 2, 'INF-002', 'Teclado ergonomico', 179.00),
    (5, 3, 'ORG-001', 'Organizador de mesa', 54.90),
    (6, 3, 'ORG-002', 'Arquivo modular', 129.90),
    (7, 4, 'MOB-001', 'Cadeira de escritorio', 899.00),
    (8, 4, 'MOB-002', 'Suporte para monitor', 219.00);

INSERT INTO sales.orders
    (order_id, customer_id, employee_id, order_date, status, discount_percent)
VALUES
    (1, 1, 2, '2025-01-10 10:15:00', 'shipped', 0),
    (2, 2, 3, '2025-01-15 14:30:00', 'shipped', 5),
    (3, 3, 2, '2025-02-02 09:00:00', 'shipped', 0),
    (4, 4, 3, '2025-02-18 16:20:00', 'confirmed', 0),
    (5, 5, 2, '2025-03-03 11:45:00', 'shipped', 10),
    (6, 6, 3, '2025-03-22 13:10:00', 'shipped', 0),
    (7, 1, 2, '2025-04-10 08:40:00', 'shipped', 0),
    (8, 7, 4, '2025-04-20 15:05:00', 'confirmed', 5),
    (9, 8, 3, '2025-05-05 10:00:00', 'pending', 0),
    (10, 2, 2, '2025-05-21 12:25:00', 'shipped', 0),
    (11, 3, 4, '2025-06-01 09:30:00', 'cancelled', 0),
    (12, 4, 3, '2025-06-08 17:00:00', 'confirmed', 0);

INSERT INTO sales.order_items
    (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 10, 38.90), (2, 1, 2, 10, 24.50),
    (3, 2, 3, 4, 89.90),  (4, 2, 5, 4, 54.90),
    (5, 3, 6, 3, 129.90), (6, 3, 1, 8, 38.90),
    (7, 4, 7, 2, 899.00), (8, 4, 8, 2, 219.00),
    (9, 5, 4, 5, 179.00), (10, 5, 3, 5, 89.90),
    (11, 6, 1, 20, 38.90), (12, 6, 2, 15, 24.50),
    (13, 7, 7, 1, 899.00), (14, 7, 5, 5, 54.90),
    (15, 8, 8, 3, 219.00), (16, 8, 6, 2, 129.90),
    (17, 9, 3, 2, 89.90),  (18, 9, 4, 2, 179.00),
    (19, 10, 1, 12, 38.90), (20, 10, 2, 12, 24.50),
    (21, 11, 7, 1, 899.00),
    (22, 12, 6, 4, 129.90), (23, 12, 5, 4, 54.90);

INSERT INTO sales.payments
    (payment_id, order_id, payment_date, amount, method, status)
VALUES
    (1, 1, '2025-01-10 10:20:00', 634.00, 'pix', 'paid'),
    (2, 2, '2025-01-16 09:00:00', 550.24, 'credit_card', 'paid'),
    (3, 3, '2025-02-02 09:10:00', 700.00, 'bank_transfer', 'paid'),
    (4, 3, NULL, 0.90, 'boleto', 'pending'),
    (5, 4, NULL, 2236.00, 'credit_card', 'pending'),
    (6, 5, '2025-03-04 11:00:00', 1210.05, 'credit_card', 'paid'),
    (7, 6, '2025-03-22 13:15:00', 1145.50, 'pix', 'paid'),
    (8, 7, '2025-04-10 08:45:00', 1173.50, 'pix', 'paid'),
    (9, 8, NULL, 870.96, 'boleto', 'pending'),
    (10, 9, NULL, 537.80, 'boleto', 'pending'),
    (11, 10, '2025-05-22 08:00:00', 760.80, 'bank_transfer', 'paid'),
    (12, 12, NULL, 739.20, 'credit_card', 'pending');

SELECT setval(pg_get_serial_sequence('sales.departments', 'department_id'), (SELECT MAX(department_id) FROM sales.departments));
SELECT setval(pg_get_serial_sequence('sales.employees', 'employee_id'), (SELECT MAX(employee_id) FROM sales.employees));
SELECT setval(pg_get_serial_sequence('sales.customers', 'customer_id'), (SELECT MAX(customer_id) FROM sales.customers));
SELECT setval(pg_get_serial_sequence('sales.categories', 'category_id'), (SELECT MAX(category_id) FROM sales.categories));
SELECT setval(pg_get_serial_sequence('sales.products', 'product_id'), (SELECT MAX(product_id) FROM sales.products));
SELECT setval(pg_get_serial_sequence('sales.orders', 'order_id'), (SELECT MAX(order_id) FROM sales.orders));
SELECT setval(pg_get_serial_sequence('sales.order_items', 'order_item_id'), (SELECT MAX(order_item_id) FROM sales.order_items));
SELECT setval(pg_get_serial_sequence('sales.payments', 'payment_id'), (SELECT MAX(payment_id) FROM sales.payments));
