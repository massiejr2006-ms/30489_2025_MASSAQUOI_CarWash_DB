/*==========================================================
 Project : Car Wash Management System (CWMS)
 Course  : Oracle Database Programming Capstone
 Student : MASSAQUOI WILLIAMS
 Reg No. : 30489/2025
 File    : 04_Insert_Sample_Data.sql
==========================================================*/

-- ======================================================
-- INSERT INTO CUSTOMER
-- ======================================================

INSERT INTO customer VALUES
(seq_customer.NEXTVAL,'John','Doe','0788000001','john@example.com','Kigali');

INSERT INTO customer VALUES
(seq_customer.NEXTVAL,'Mary','Smith','0788000002','mary@example.com','Huye');

INSERT INTO customer VALUES
(seq_customer.NEXTVAL,'Peter','Johnson','0788000003','peter@example.com','Musanze');

INSERT INTO customer VALUES
(seq_customer.NEXTVAL,'Grace','Williams','0788000004','grace@example.com','Rubavu');

INSERT INTO customer VALUES
(seq_customer.NEXTVAL,'David','Brown','0788000005','david@example.com','Kigali');

-- ======================================================
-- INSERT INTO EMPLOYEE
-- ======================================================

INSERT INTO employee VALUES
(seq_employee.NEXTVAL,'James','Mugisha','Manager','0788111111');

INSERT INTO employee VALUES
(seq_employee.NEXTVAL,'Eric','Uwimana','Receptionist','0788222222');

INSERT INTO employee VALUES
(seq_employee.NEXTVAL,'Samuel','Hakizimana','Attendant','0788333333');

-- ======================================================
-- INSERT INTO SERVICE
-- ======================================================

INSERT INTO service VALUES
(seq_service.NEXTVAL,'Basic Wash',10);

INSERT INTO service VALUES
(seq_service.NEXTVAL,'Premium Wash',20);

INSERT INTO service VALUES
(seq_service.NEXTVAL,'Interior Cleaning',15);

INSERT INTO service VALUES
(seq_service.NEXTVAL,'Engine Cleaning',25);

INSERT INTO service VALUES
(seq_service.NEXTVAL,'Wax Polish',30);

-- ======================================================
-- INSERT INTO VEHICLE
-- ======================================================

INSERT INTO vehicle VALUES
(seq_vehicle.NEXTVAL,1,'RAB101A','Car','Toyota Corolla');

INSERT INTO vehicle VALUES
(seq_vehicle.NEXTVAL,2,'RAB202B','SUV','Toyota Prado');

INSERT INTO vehicle VALUES
(seq_vehicle.NEXTVAL,3,'RAB303C','Truck','Isuzu');

INSERT INTO vehicle VALUES
(seq_vehicle.NEXTVAL,4,'RAB404D','Motorcycle','Yamaha');

INSERT INTO vehicle VALUES
(seq_vehicle.NEXTVAL,5,'RAB505E','Van','Hyundai H1');

-- ======================================================
-- INSERT INTO SERVICE_ORDER
-- ======================================================

INSERT INTO service_order VALUES
(seq_service_order.NEXTVAL,1,1,2,SYSDATE,'PENDING');

INSERT INTO service_order VALUES
(seq_service_order.NEXTVAL,2,2,3,SYSDATE,'COMPLETED');

INSERT INTO service_order VALUES
(seq_service_order.NEXTVAL,3,3,3,SYSDATE,'PAID');

-- ======================================================
-- INSERT INTO ORDER_DETAIL
-- ======================================================

INSERT INTO order_detail VALUES
(seq_order_detail.NEXTVAL,1,1,1,10);

INSERT INTO order_detail VALUES
(seq_order_detail.NEXTVAL,2,2,1,20);

INSERT INTO order_detail VALUES
(seq_order_detail.NEXTVAL,3,3,2,30);

-- ======================================================
-- INSERT INTO PAYMENT
-- ======================================================

INSERT INTO payment VALUES
(seq_payment.NEXTVAL,2,SYSDATE,20,'Cash');

INSERT INTO payment VALUES
(seq_payment.NEXTVAL,3,SYSDATE,60,'Mobile Money');

-- ======================================================
-- INSERT INTO PUBLIC_HOLIDAY
-- ======================================================

INSERT INTO public_holiday VALUES
(seq_public_holiday.NEXTVAL,'New Year',DATE '2026-01-01');

INSERT INTO public_holiday VALUES
(seq_public_holiday.NEXTVAL,'Labour Day',DATE '2026-05-01');

INSERT INTO public_holiday VALUES
(seq_public_holiday.NEXTVAL,'Christmas',DATE '2026-12-25');

COMMIT;

-- ======================================================
-- VERIFY INSERTED DATA
-- ======================================================

SELECT COUNT(*) AS customers FROM customer;
SELECT COUNT(*) AS employees FROM employee;
SELECT COUNT(*) AS services FROM service;
SELECT COUNT(*) AS vehicles FROM vehicle;
SELECT COUNT(*) AS orders FROM service_order;
SELECT COUNT(*) AS order_details FROM order_detail;
SELECT COUNT(*) AS payments FROM payment;
SELECT COUNT(*) AS holidays FROM public_holiday;
