-- [ Data Definition Language (DDL) ]


-- TNI Practical Exercise 1: DDL Statements
-- Creating the customer table
CREATE TABLE customer (
    customer_id     VARCHAR(4)     PRIMARY KEY,
    first_name      VARCHAR(20)    NOT NULL,
    last_name       VARCHAR(20)    NOT NULL,
    phone_number    VARCHAR(10)    NOT NULL,
    c_location      VARCHAR(50)    NOT NULL,
    city            VARCHAR(20)    NOT NULL,
    postal_code     VARCHAR(5)     NOT NULL
);


-- Adding email column to customer table
ALTER TABLE customer
ADD COLUMN email VARCHAR(50);


-- Dropping the c_location column from customer table
ALTER TABLE customer
DROP COLUMN c_location;


-- Renaming phone_number column to contact_number in customer table
ALTER TABLE customer
RENAME COLUMN phone_number TO contact_number;


-- Modifying the data type of contact_number column to VARCHAR(15)
ALTER TABLE customer
MODIFY contact_number VARCHAR(15);


-- Renaming the customer table to clients
ALTER TABLE customer
RENAME TO clients;


-- TNI Practical Exercise 2: DDL Statements
-- Creating the animal_treatment table
CREATE TABLE animal_treatment (
 t_id       CHAR(4)         PRIMARY KEY,
 pet_id     CHAR(4)         NOT NULL,
 pet_name   VARCHAR(50)     NOT NULL,
 pet_type   VARCHAR(10),
 treatment  VARCHAR(200)    NOT NULL,
 t_date     DATE            DEFAULT SYSDATE,
 owner_id   CHAR(4),
 charge     NUMBER(8)       DEFAULT 200,
 
 CHECK(pet_type IN ('Dog', 'Cat'))
);


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


-- Updating the owner_id for Morris in animal_treatment table
UPDATE animal_treatment
SET owner_id = '1'
WHERE pet_name = 'Morris';


-- Creating the owner table
CREATE TABLE owner (
 owner_id   CHAR(4)     PRIMARY KEY,
 owner_name VARCHAR(50) NOT NULL
);


-- Adding a row to owner table
INSERT INTO owner(owner_id, owner_name)
VALUES('1', 'Sam');


INSERT INTO owner(owner_id, owner_name)
VALUES('2', 'Kim');


-- Adding a foreign key constraint to animal_treatment table referencing owner table
ALTER TABLE animal_treatment
ADD CONSTRAINT owner_id_fk
FOREIGN KEY(owner_id)
REFERENCES owner(owner_id);


-- Creating a sequence for treatment IDs
CREATE SEQUENCE seq_treatment
INCREMENT BY 100
MINVALUE 400
MAXVALUE 9900

NOCYCLE
NOCACHE;


-- Inserting a new treatment record using the sequence for t_id
INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES(seq_treatment.NEXTVAL, 'P004', 'Tweedy', 'Dog', 'Check Up', DEFAULT, '2', DEFAULT);


-- Creating a view to show total pay for each owner
CREATE VIEW view_owner_pay
AS
  SELECT owner_name, TO_CHAR(sum(charge), '999,999.00') AS "Total Pay"
  FROM owner o INNER JOIN animal_treatment a ON o.owner_id = a.owner_id
  GROUP BY owner_name;


-- Deleting records from animal_treatment table where pet_name starts with 'T' or contains 't'
DELETE FROM animal_treatment
WHERE pet_name LIKE 'T%' OR pet_name LIKE '%t%';