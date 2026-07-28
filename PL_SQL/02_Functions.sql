/*==========================================================
 Project : Car Wash Management System (CWMS)
 Course  : Oracle Database Programming Capstone
 Student : MASSAQUOI WILLIAMS
 Reg No. : 30489/2025
 File    : 02_Functions.sql
==========================================================*/

-- ======================================================
-- FUNCTION 1: CALCULATE ORDER TOTAL
-- ======================================================

CREATE OR REPLACE FUNCTION calculate_order_total (
    p_order_id IN NUMBER
)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT SUM(quantity * unit_price)
    INTO v_total
    FROM order_detail
    WHERE order_id = p_order_id;

    RETURN NVL(v_total, 0);
END;
/

-- ======================================================
-- FUNCTION 2: COUNT CUSTOMER VEHICLES
-- ======================================================

CREATE OR REPLACE FUNCTION customer_vehicle_count (
    p_customer_id IN NUMBER
)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM vehicle
    WHERE customer_id = p_customer_id;

    RETURN v_count;
END;
/

-- ======================================================
-- FUNCTION 3: COUNT EMPLOYEE ORDERS
-- ======================================================

CREATE OR REPLACE FUNCTION employee_order_count (
    p_employee_id IN NUMBER
)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM service_order
    WHERE employee_id = p_employee_id;

    RETURN v_count;
END;
/

-- ======================================================
-- FUNCTION 4: CHECK CUSTOMER EXISTS
-- ======================================================

CREATE OR REPLACE FUNCTION customer_exists (
    p_customer_id IN NUMBER
)
RETURN VARCHAR2
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM customer
    WHERE customer_id = p_customer_id;

    IF v_count > 0 THEN
        RETURN 'YES';
    ELSE
        RETURN 'NO';
    END IF;
END;
/

-- ======================================================
-- FUNCTION 5: GET SERVICE PRICE
-- ======================================================

CREATE OR REPLACE FUNCTION get_service_price (
    p_service_id IN NUMBER
)
RETURN NUMBER
IS
    v_price NUMBER;
BEGIN
    SELECT price
    INTO v_price
    FROM service
    WHERE service_id = p_service_id;

    RETURN v_price;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

-- ======================================================
-- TEST THE FUNCTIONS
-- ======================================================

-- Total amount for Order 1
SELECT calculate_order_total(1) AS order_total
FROM dual;

-- Number of vehicles owned by Customer 1
SELECT customer_vehicle_count(1) AS vehicle_count
FROM dual;

-- Number of orders handled by Employee 1
SELECT employee_order_count(1) AS order_count
FROM dual;

-- Check if Customer 1 exists
SELECT customer_exists(1) AS customer_found
FROM dual;

-- Get the price of Service 1
SELECT get_service_price(1) AS service_price
FROM dual;
