# DDL
CREATE DATABASE NOMALIZATION;
USE NOMALIZATION;

CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
	CUSTOMER_NAME VARCHAR(100)
);

CREATE TABLE ORDERS (
	ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
	CUSTOMER_ID INT,
	ORDER_DATE DATE,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE ORDER_ITEMS(
	ORDER_ITEM_ID INT AUTO_INCREMENT PRIMARY KEY,
	ORDER_ID INT,
	PRODUCT_NAME VARCHAR(100),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);
