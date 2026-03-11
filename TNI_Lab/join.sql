SELECT last_name, job_title
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id
WHERE job_title = 'Programmer';



SELECT count(last_name), job_title
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id
WHERE job_title = 'Programmer'
GROUP BY job_title;



SELECT last_name, job_title, department_name
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id 
                    INNER JOIN hr.departments d ON e.department_id = d.department_id
WHERE job_title = 'Programmer';



SELECT last_name, job_title, country_name, state_province
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id 
                    INNER JOIN hr.departments d ON e.department_id = d.department_id
                    INNER JOIN hr.locations l ON l.location_id = d.location_id
                    INNER JOIN hr.countries c ON c.country_id = l.country_id
WHERE job_title = 'Programmer';



SELECT last_name, state_province
FROM hr.employees e LEFT JOIN hr.departments d ON e.department_id = d.department_id
                    LEFT JOIN hr.locations l ON l.location_id = d.location_id;



SELECT count(last_name), state_province
FROM hr.employees e INNER JOIN hr.departments d ON e.department_id = d.department_id
                    INNER JOIN hr.locations l ON l.location_id = d.location_id
GROUP BY state_province;



SELECT last_name, state_province, street_address
FROM hr.employees e INNER JOIN hr.departments d ON e.department_id = d.department_id
                    INNER JOIN hr.locations l ON l.location_id = d.location_id
WHERE state_province IS NULL AND street_address IS NULL;