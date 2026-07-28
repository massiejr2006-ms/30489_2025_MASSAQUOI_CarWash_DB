/*==========================================================
 Project : Car Wash Management System (CWMS)
 Course  : Oracle Database Programming Capstone
 Student : MASSAQUOI WILLIAMS
 Reg No. : 30489/2025
 File    : 01_Create_User.sql
==========================================================*/

-- ======================================================
-- CREATE DATABASE USER
-- ======================================================

CREATE USER cwms_admin
IDENTIFIED BY cwms@2026
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS;

-- ======================================================
-- GRANT SYSTEM PRIVILEGES
-- ======================================================

GRANT CREATE SESSION TO cwms_admin;

GRANT CREATE TABLE TO cwms_admin;

GRANT CREATE VIEW TO cwms_admin;

GRANT CREATE SEQUENCE TO cwms_admin;

GRANT CREATE PROCEDURE TO cwms_admin;

GRANT CREATE TRIGGER TO cwms_admin;

GRANT CREATE SYNONYM TO cwms_admin;

GRANT CREATE TYPE TO cwms_admin;

GRANT CREATE PACKAGE TO cwms_admin;

-- ======================================================
-- VERIFY USER
-- ======================================================

SELECT username,
       account_status,
       default_tablespace
FROM dba_users
WHERE username = 'CWMS_ADMIN';
