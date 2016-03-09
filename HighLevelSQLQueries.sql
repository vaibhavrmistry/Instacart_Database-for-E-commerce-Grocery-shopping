-- Revenue Generated per product

SELECT product.pk_Product_id AS PRODUCT_ID,
product.Product_name AS PRODUCT_NAME,
SUM(orderitem.quantity) AS QUANTITY,
SUM(orderitem.quantity) * product.Product_price AS TOTAL
FROM `order`
INNER JOIN orderitem
ON `order`.pk_Order_id = orderitem.fk_Order_id
INNER JOIN product
ON product.pk_Product_id = orderitem.fk_Product_id
 GROUP BY product.pk_Product_id ;













-- MAX product sold per grocery store
SELECT product.pk_Product_id AS PRODUCT_ID,
product.Product_name AS PRODUCT_NAME,
grocerystore.GroceryStore_name AS GROCERY_STORE,
MAX(orderitem.quantity)AS QUANTITY
FROM `order`
INNER JOIN orderitem
ON `order`.pk_Order_id = orderitem.fk_Order_id
INNER JOIN product
ON product.pk_Product_id = orderitem.fk_Product_id
INNER JOIN productavailability
ON product.pk_Product_id = productavailability.Product_Product_id
INNER JOIN grocerystore
ON productavailability.GroceryStore_GroceryStore_id = grocerystore.pk_GroceryStore_id
GROUP BY grocerystore.GroceryStore_name;










-- get total spend by each customer
SELECT customer.pk_Customer_id AS CUSTOMER_ID,
person.first_name AS FIRST_NAME,
person.middle_name AS MIDDLE_NAME,
person.last_name AS LAST_NAME,
SUM(`order`.order_price) AS AMOUNT
FROM customer
INNER JOIN person
ON customer.fk_person_id = person.pk_Person_id
INNER JOIN customerorderhistory
ON customer.pk_Customer_id = customerorderhistory.fk_Customer_id
INNER JOIN `order`
ON `order`.pk_Order_id = customerorderhistory.Order_Order_id

GROUP BY customer.pk_Customer_id;






