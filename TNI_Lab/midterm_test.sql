-- TNI Lab Midterm Test SQL Solutions from Midterm Test on 2026-01-23.


-- 01
SELECT last_name, job_id, salary, department_id
FROM hr.employees
WHERE job_id LIKE 'IT_PROG' OR
      (job_id LIKE 'FI_ACCOUNT' AND 5000 <= salary AND salary <= 10000) OR
      (department_id = 80 AND 5000 <= salary AND salary <= 10000)
ORDER BY job_id ASC, salary DESC;


-- 02
SELECT last_name, salary, department_name, '&city' AS "CITY"
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id;


-- 03
SELECT length(concat('&firstname', '&lastname')) AS "Length of Name"
FROM dual;


-- 04
SELECT last_name, department_name, salary, (salary + (salary * 0.05)) AS "New Salary"
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
WHERE department_name LIKE 'Sales' OR department_name LIKE 'Shipping';


-- 05
SELECT employee_id, last_name, department_name
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
WHERE department_name LIKE '%ing';


-- 06
SELECT concat(city, ' ' || state_province) AS "Address", department_name
FROM hr.locations INNER JOIN hr.departments ON hr.locations.location_id = hr.departments.location_id;


-- 07
SELECT to_char(hire_date, 'YYYY') AS "Year",
       to_char(hire_date, 'Month') AS "Month",
       to_char(hire_date, 'DD') AS "Day",
       first_name, last_name
FROM hr.employees
WHERE to_char(hire_date, 'MM') IN (10, 11, 12)
ORDER BY to_char(hire_date, 'Month') ASC,
         to_char(hire_date, 'YYYY') DESC,
         to_char(hire_date, 'DD') ASC,
         first_name ASC;


-- 08
SELECT to_char(hire_date, 'YYYY') AS "Year",
       to_char(hire_date, 'Month') AS "Month",
       to_char(hire_date, 'DD') AS "Day",
       first_name, last_name, department_name
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
WHERE to_char(hire_date, 'MM') IN (10, 11, 12)
ORDER BY to_char(hire_date, 'Month') DESC,
         to_char(hire_date, 'YYYY') ASC,
         to_char(hire_date, 'DD') DESC,
         first_name ASC;


-- 09
SELECT employee_id, concat(first_name, ' ' || last_name) AS "Name", job_id,
length(last_name)
FROM hr.employees
WHERE concat(first_name, ' ' || last_name) LIKE '%n';