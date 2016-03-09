CREATE USER 'instacart_db_admin'@'%';
GRANT ALL PRIVILEGES ON instacart_db.* TO 'instacart_db_admin'@'%';

CREATE USER 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.employee_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.employeesalary_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.product_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.product_availability_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.product_discount_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.grocery_store_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.grocerystore_address_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.department_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.shipping_employee_v TO 'manager'@'%';
GRANT SELECT ON instacart_db.product_rating_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.order_v TO 'manager'@'%';
GRANT SELECT ON instacart_db.order_item_v TO 'manager'@'%';
GRANT SELECT ON instacart_db.order_tax_v TO 'manager'@'%';
GRANT SELECT ON instacart_db.invoice_details_v TO 'manager'@'%';
GRANT SELECT ON instacart_db.shipment_v TO 'manager'@'%';
GRANT SELECT,UPDATE, INSERT ON instacart_db.address_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_address_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_email_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_phone_v TO 'manager'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.discount_coupon TO 'manager'@'%';
GRANT SELECT ON instacart_db.customer_v TO 'manager'@'%';

CREATE USER 'shipping_employee'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.shipment_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.order_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.order_item_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.order_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.invoice_details_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.order_v TO 'shipping_employee'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.address_v TO 'shipping_employee'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person TO 'shipping_employee'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_email_v TO 'shipping_employee'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_phone_v TO 'shipping_employee'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_address_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.product_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.product_availability_v TO 'shipping_employee'@'%';
GRANT SELECT ON instacart_db.grocery_store_v TO 'shipping_employee'@'%';

CREATE USER 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.order_tax_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.invoice_details_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.order_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.order_item_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.order_tax_v TO 'financial_accountant'@'%';
GRANT SELECT ON instacart_db.discount_coupon TO 'financial_accountant'@'%';
GRANT SELECT ON instacart_db.product_discount_v TO 'financial_accountant'@'%';
GRANT SELECT ON instacart_db.order_tax_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_email_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_phone_v TO 'financial_accountant'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_address_v TO 'financial_accountant'@'%';

CREATE USER 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.customer_v TO 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.payment_details_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.customer_type_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.discount_coupon TO 'customer'@'%';
GRANT SELECT ON instacart_db.customer_order_history_v TO 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.product_rating_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.product_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.product_availability_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.grocery_store_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.product_v TO 'customer'@'%';
GRANT SELECT, INSERT ON instacart_db.order_item_v TO 'customer'@'%';
GRANT SELECT, INSERT ON instacart_db.order_v TO 'customer'@'%';
GRANT SELECT ON instacart_db.department TO 'customer'@'%';
GRANT SELECT,INSERT ON instacart_db.invoice_details_v TO 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person TO 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_email_v TO 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_phone_v TO 'customer'@'%';
GRANT SELECT,UPDATE,INSERT ON instacart_db.person_address_v TO 'customer'@'%';












