-- [ Subquery Practice Exercises ]


-- Display the first_name, last_name, and salary of all employees who earn more than employee 149.
SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary > (SELECT salary
                FROM hr.employees
                WHERE employee_id = 149);


-- Display the last_name, job_id, and salary of all employees who earn less than the average salary in the company.
SELECT last_name, job_id, salary
FROM hr.employees
WHERE salary < (SELECT avg(salary)
                FROM hr.employees);


-- Display the employees whoose job_id is the same as that employee 141.
SELECT last_name, job_id
FROM hr.employees
WHERE job_id = (SELECT job_id
                FROM hr.employees
                WHERE employee_id = 141);


-- Display the employees whoose job_id is the same as that employee 141, but earn more salary than him.
SELECT last_name, job_id, salary
FROM hr.employees
WHERE job_id = (SELECT job_id
                FROM hr.employees
                WHERE employee_id = 141)
    AND salary > (SELECT salary
                  FROM hr.employees
                  WHERE employee_id = 141);


-- Display the last name, job ID, and salary of the employee(s) with the lowest salary.
SELECT last_name, job_id, salary
FROM hr.employees
WHERE salary = (SELECT min(salary)
                FROM hr.employees);


-- Find departments where the minimum salary is greater than the minimum salary of department 50.
SELECT department_id, min(salary)
FROM hr.employees
GROUP BY department_id
HAVING min(salary) > (SELECT min(salary)
                      FROM hr.employees
                      WHERE department_id = 50);


-- Find the job with lowest average salary.
SELECT job_id, avg(salary)
FROM hr.employees
GROUP BY job_id
HAVING avg(salary) = (SELECT min(avg(salary))
                      FROM hr.employees
                      GROUP BY job_id);


-- Display the last name and salary of every employee who reports to Steven King.
SELECT last_name, salary
FROM hr.employees
WHERE manager_id = (SELECT employee_id
                    FROM hr.employees
                    WHERE last_name = 'King' AND first_name = 'Steven');


-- Display the department ID, last name, and job ID of all employees who work in the 'Executive' department.
SELECT department_id, last_name, job_id
FROM hr.employees
WHERE department_id = (SELECT department_id
                       FROM hr.departments
                       WHERE department_name = 'Executive');


-- Display the employee ID, last name, and salary of all employees who earn more than the average salary 
-- and work in departments that have at least one employee whose last name contains the letter 'u' (case-insensitive).
SELECT employee_id, last_name, salary
FROM hr.employees
WHERE salary > (SELECT avg(salary)
                FROM hr.employees)
    AND department_id in (SELECT department_id
                          FROM hr.employees
                          WHERE last_name LIKE '%u%' OR last_name LIKE 'U%');