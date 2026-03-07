-- language=SQL



CREATE TABLE customer (
    customer_id     VARCHAR(4)     PRIMARY KEY,
    first_name      VARCHAR(20)    NOT NULL,
    last_name       VARCHAR(20)    NOT NULL,
    phone_number    VARCHAR(10)    NOT NULL,
    c_location      VARCHAR(50)    NOT NULL,
    city            VARCHAR(20)    NOT NULL,
    postal_code     VARCHAR(5)     NOT NULL
);



ALTER TABLE customer
ADD email VARCHAR(50);



ALTER TABLE customer
DROP COLUMN c_location;



ALTER TABLE customer
RENAME COLUMN phone_number TO contact_number;



ALTER TABLE customer
MODIFY contact_number VARCHAR(15);



ALTER TABLE customer
RENAME TO clients;



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



CREATE TABLE owner (
 owner_id   CHAR(4)     PRIMARY KEY,
 owner_name VARCHAR(50) NOT NULL
);



ALTER TABLE animal_treatment
ADD CONSTRAINT owner_id_fk
FOREIGN KEY(owner_id)
REFERENCES owner(owner_id);



CREATE SEQUENCE seq_treatment
INCREMENT BY 100
MINVALUE 400
MAXVALUE 9900

NOCYCLE
NOCACHE;



CREATE VIEW view_owner_pay
AS
  SELECT owner_name, TO_CHAR(sum(charge), '999,999.00') AS "Total Pay"
  FROM owner o INNER JOIN animal_treatment a ON o.owner_id = a.owner_id
  GROUP BY owner_name;