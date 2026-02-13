-- [ Data Definition Language (DDL) ]


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