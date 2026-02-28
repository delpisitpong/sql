-- [ Data Manipulation Language (DML) SQL ]


-- Selecting all records from the employees table
SELECT *
FROM employees;


-- Inserting sample data into the customer table
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


-- Adding a row to animal_treatment table
INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES
    ('100', 'P001', 'Rover',  'Dog', 'Vaccinate', TO_DATE('13-Jan-23','DD-MON-RR'), '1', 500);


INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES
    ('200', 'P002', 'Sport',  'Dog', 'Injure', TO_DATE('21-Jan-23','DD-MON-RR'), '2', 1000);


INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES
    ('300', 'P003', 'Morris',  'Cat', 'Check Up', TO_DATE('13-Jan-23','DD-MON-RR'), '2', 200);


-- Adding a row to owner table
INSERT INTO owner(owner_id, owner_name)
VALUES('1', 'Sam');


INSERT INTO owner(owner_id, owner_name)
VALUES('2', 'Kim');


-- Inserting a new treatment record using the sequence for t_id
INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES(seq_treatment.NEXTVAL, 'P004', 'Tweedy', 'Dog', 'Check Up', DEFAULT, '2', DEFAULT);


-- Deleting records from animal_treatment table where pet_name starts with 'T' or contains 't'
DELETE FROM animal_treatment
WHERE pet_name LIKE 'T%' OR pet_name LIKE '%t%';