-- [ Data Manipulation Language (DML) SQL ]


-- Selecting all records from the employees table
SELECT *
FROM employees;


--- Inserting sample data into the customer table
INSERT INTO customer (customer_id, first_name, last_name, phone_number, c_location, city, postal_code) 
VALUES
    ('C001', 'John', 'Doe', '1234567890', '123 Main St', 'Springfield', '12345'),
    ('C002', 'Jane', 'Smith', '0987654321', '456 Elm St', 'Shelbyville', '54321'),
    ('C003', 'Alice', 'Johnson', '5551234567', '789 Oak St', 'Ogdenville', '67890'),
    ('C004', 'Bob', 'Brown', '4449876543', '321 Pine St', 'North Haverbrook', '98765');


-- Updating the phone number for a specific customer
UPDATE customer
SET phone_number = '1112223333'
WHERE customer_id = 'C001';


-- Deleting a customer record
DELETE FROM customer
WHERE customer_id = 'C004';