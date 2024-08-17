# INSERT ROW
INSERT INTO CUSTOMERS (CUSTOMER_NAME) VALUES ('Alice Johnson');
INSERT INTO CUSTOMERS (CUSTOMER_NAME) VALUES ('Bob Smith');

INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE) VALUES (1, '2024-08-01'); 
INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE) VALUES (2, '2024-08-02');


INSERT INTO ORDER_ITEMS (ORDER_ID, PRODUCT_NAME) VALUES (1, 'Laptop');
INSERT INTO ORDER_ITEMS (ORDER_ID, PRODUCT_NAME) VALUES (1, 'Mouse');
INSERT INTO ORDER_ITEMS (ORDER_ID, PRODUCT_NAME) VALUES (2, 'Keyboard');

#SELECT ROW
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT
	customers.CUSTOMER_NAME,
	orders.ORDER_ID,
	orders.ORDER_DATE,
	order_items.PRODUCT_NAME
FROM
	customers
JOIN 
	orders 
ON 
	customers.CUSTOMER_ID = orders.CUSTOMER_ID
JOIN 
	ORDER_ITEMS
ON
	orders.ORDER_ID = order_items.ORDER_ID
ORDER BY
	customers.CUSTOMER_NAME, orders.ORDER_ID;

#UPDATE ROW
UPDATE 
	customers
SET
	CUSTOMER_NAME = 'Alice Doe'
WHERE
	CUSTOMER_NAME = 'Alice Johnson';

UPDATE
	orders
SET
	ORDER_DATE = '2024-08-05'
WHERE
	ORDER_ID = 1;
	
#DELETE ROW
DELETE FROM order_items
WHERE ORDER_ID = 1;

DELETE FROM orders 
WHERE ORDER_ID = 1;

DELETE FROM customers
WHERE CUSTOMER_NAME = 'Alice Doe';

