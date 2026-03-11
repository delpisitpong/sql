SELECT first_name, last_name, salary
FROM hr.employees
WHERE salary > (SELECT salary
                FROM hr.employees
                WHERE employee_id = 149);



SELECT last_name, job_id, salary
FROM hr.employees
WHERE salary < (SELECT avg(salary)
                FROM hr.employees);



SELECT last_name, job_id
FROM hr.employees
WHERE job_id = (SELECT job_id
                FROM hr.employees
                WHERE employee_id = 141);



SELECT last_name, job_id, salary
FROM hr.employees
WHERE job_id = (SELECT job_id
                FROM hr.employees
                WHERE employee_id = 141)
    AND salary > (SELECT salary
                  FROM hr.employees
                  WHERE employee_id = 141);



SELECT last_name, job_id, salary
FROM hr.employees
WHERE salary = (SELECT min(salary)
                FROM hr.employees);



SELECT department_id, min(salary)
FROM hr.employees
GROUP BY department_id
HAVING min(salary) > (SELECT min(salary)
                      FROM hr.employees
                      WHERE department_id = 50);



SELECT job_id, avg(salary)
FROM hr.employees
GROUP BY job_id
HAVING avg(salary) = (SELECT min(avg(salary))
                      FROM hr.employees
                      GROUP BY job_id);



SELECT last_name, salary
FROM hr.employees
WHERE manager_id = (SELECT employee_id
                    FROM hr.employees
                    WHERE last_name = 'King' AND first_name = 'Steven');



SELECT department_id, last_name, job_id
FROM hr.employees
WHERE department_id = (SELECT department_id
                       FROM hr.departments
                       WHERE department_name = 'Executive');



SELECT employee_id, last_name, salary
FROM hr.employees
WHERE salary > (SELECT avg(salary)
                FROM hr.employees)
    AND department_id in (SELECT department_id
                          FROM hr.employees
                          WHERE last_name LIKE '%u%' OR last_name LIKE 'U%');