-- language=SQL



CREATE VIEW my_view
AS SELECT course_id, assignment_name, due_date
   FROM my_assignment
   WHERE course_id = 'DAT-101' AND a_status = 'NOT_SUBMIT';
   


SELECT *
FROM my_view;