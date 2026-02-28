-- [ Procedural Language/Structured Query Language (PL/SQL) ]


-- TNI Practical Exercise 1: PL/SQL Block
DECLARE
    v_emp_hiredate  employees.hire_date%TYPE;
    v_emp_salary    employees.salary%TYPE;

BEGIN
    SELECT hire_date, salary INTO v_emp_hiredate, v_emp_salary
    FROM employees
    WHERE employee_id = 100;
    dbms_output.put_line('Hire Date = ' || v_emp_hiredate);
    dbms_output.put_line('Salary = ' || TO_CHAR(v_emp_salary, '999,999.00'));

END;
/


-- TNI Practical Exercise 2: PL/SQL Block with User Input
DECLARE
    v_last_name     employees.last_name%TYPE := '&input_name';
    v_first_name    employees.first_name%TYPE;
    v_salary        employees.salary%TYPE;

BEGIN
    SELECT first_name, salary INTO v_first_name, v_salary
    FROM employees
    WHERE last_name = v_last_name;
    dbms_output.put_line('Employee name is '  v_first_name  ' with salary ' || v_salary);

END;
/