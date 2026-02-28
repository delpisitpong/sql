-- [ Data Control Language (DCL) SQL ]


-- Granting SELECT and INSERT privileges on the customer table to user 'tni_user'
GRANT SELECT, INSERT ON customer TO tni_user;


-- Attacking the database with a SQL injection vulnerability
SELECT *
FROM employees
WHERE employee_id = 1234 OR 1 = 1;