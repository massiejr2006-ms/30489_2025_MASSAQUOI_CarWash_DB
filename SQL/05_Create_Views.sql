/*==========================================================
 Project : Car Wash Management System (CWMS)
 Course  : Oracle Database Programming Capstone
 Student : MASSAQUOI WILLIAMS
 Reg No. : 30489/2025
 File    : 05_Create_Views.sql
==========================================================*/

-- ======================================================
-- VIEW 1: CUSTOMER VEHICLES
-- ======================================================

CREATE OR REPLACE VIEW vw_customer_vehicles AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    v.vehicle_id,
    v.plate_number,
    v.vehicle_type,
    v.vehicle_model
FROM customer c
JOIN vehicle v
ON c.customer_id = v.customer_id;

-- ======================================================
-- VIEW 2: ORDER SUMMARY
-- ======================================================

CREATE OR REPLACE VIEW vw_order_summary AS
SELECT
    so.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    v.plate_number,
    e.first_name || ' ' || e.last_name AS employee_name,
    so.order_date,
    so.status
FROM service_order so
JOIN customer c
ON so.customer_id = c.customer_id
JOIN vehicle v
ON so.vehicle_id = v.vehicle_id
JOIN employee e
ON so.employee_id = e.employee_id;

-- ======================================================
-- VIEW 3: DAILY REVENUE
-- ======================================================

CREATE OR REPLACE VIEW vw_daily_revenue AS
SELECT
    TRUNC(payment_date) AS payment_day,
    COUNT(payment_id) AS total_payments,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY TRUNC(payment_date);

-- ======================================================
-- VIEW 4: EMPLOYEE PERFORMANCE
-- ======================================================

CREATE OR REPLACE VIEW vw_employee_performance AS
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(so.order_id) AS total_orders
FROM employee e
LEFT JOIN service_order so
ON e.employee_id = so.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name;

-- ======================================================
-- VERIFY CREATED VIEWS
-- ======================================================

SELECT view_name
FROM user_views
ORDER BY view_name;


Test the Views

SELECT * FROM vw_customer_vehicles;

SELECT * FROM vw_order_summary;

SELECT * FROM vw_daily_revenue;

SELECT * FROM vw_employee_performance;
