-- language=SQL



SELECT *
FROM employees;



UPDATE customer
SET phone_number = '1112223333'
WHERE customer_id = 'C001';



DELETE FROM customer
WHERE customer_id = 'C004';



INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES('100', 'P001', 'Rover',  'Dog', 'Vaccinate', TO_DATE('13-Jan-23','DD-MON-RR'), '1', 500);

INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES('200', 'P002', 'Sport',  'Dog', 'Injure', TO_DATE('21-Jan-23','DD-MON-RR'), '2', 1000);

INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES('300', 'P003', 'Morris',  'Cat', 'Check Up', TO_DATE('13-Jan-23','DD-MON-RR'), '2', 200);



INSERT INTO owner(owner_id, owner_name)
VALUES('1', 'Sam');


INSERT INTO owner(owner_id, owner_name)
VALUES('2', 'Kim');



INSERT INTO animal_treatment(t_id, pet_id, pet_name, pet_type, treatment, t_date, owner_id, charge)
VALUES(seq_treatment.NEXTVAL, 'P004', 'Tweedy', 'Dog', 'Check Up', DEFAULT, '2', DEFAULT);



DELETE FROM animal_treatment
WHERE pet_name LIKE 'T%' OR pet_name LIKE '%t%';