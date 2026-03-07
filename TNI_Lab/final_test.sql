-- language=SQL
-- TNI Lab Final Test SQL Solutions from Final Test on 2026-03-06.



CREATE TABLE my_course (
    course_id   VARCHAR(6)      PRIMARY KEY,
    course_name VARCHAR(100)    NOT NULL,
    teacher     VARCHAR(100)    NOT NULL
);


ALTER TABLE my_course
MODIFY course_id VARCHAR(7);



INSERT INTO my_course VALUES('DAT-101', 'Data Understanding', 'Aj.Adisak');
INSERT INTO my_course VALUES('DAT-102', 'Programming for DS', 'Aj.Lalita');
INSERT INTO my_course VALUES('DAT-103', 'Database for DS', 'Aj.Kanda');



CREATE TABLE my_assignment (
    assign_id           NUMBER(12)      PRIMARY KEY,
    course_id           VARCHAR(7)      NOT NULL,
    assignment_name     VARCHAR(200)    NOT NULL,
    due_date            DATE            NOT NULL,
    channel_for_send    VARCHAR(50)     NOT NULL,
    max_score           NUMBER(3)
);


ALTER TABLE my_assignment
ADD CONSTRAINT fk_my_assignment_table
FOREIGN KEY(course_id)
REFERENCES my_course(course_id);



INSERT INTO my_assignment(assign_id, course_id, assignment_name, due_date, channel_for_send, max_score)
VALUES(50001, 'DAT-101', 'Clean with Excel', DATE '2026-01-10', 'MS Team', 10);

INSERT INTO my_assignment(assign_id, course_id, assignment_name, due_date, channel_for_send, max_score)
VALUES(50002, 'DAT-102', 'Java Loop', DATE '2026-02-20', 'Google Form', 15);

INSERT INTO my_assignment(assign_id, course_id, assignment_name, due_date, channel_for_send, max_score)
VALUES(50003, 'DAT-103', 'Create table', DATE '2026-03-20', 'Email', 10);

INSERT INTO my_assignment(assign_id, course_id, assignment_name, due_date, channel_for_send, max_score)
VALUES(50004, 'DAT-104', 'Merge data', DATE '2026-01-17', 'MS Team', 20);



CREATE TABLE my_teacher (
    t_id    NUMBER(3)   PRIMARY KEY,
    t_name  VARCHAR(100)    NOT NULL
);


INSERT INTO my_teacher VALUES(100, 'Aj.Adisak');
INSERT INTO my_teacher VALUES(200, 'Aj.Lalita');
INSERT INTO my_teacher VALUES(300, 'Aj.Kanda');



INSERT INTO my_course VALUES('DAT-104', 'Data Structure', 'Aj.Lalita');



ALTER TABLE my_course
ADD teacher_id NUMBER(3);



UPDATE my_course
SET teacher_id = (SELECT t_id
                  FROM my_teacher
                  WHERE t_name = 'Aj.Lalita')
WHERE teacher = 'Aj.Lalita';



ALTER TABLE my_course
DROP COLUMN teacher;



ALTER TABLE my_course
ADD CONSTRAINT fk_course_teacher
FOREIGN KEY(teacher_id)
REFERENCES my_teacher(t_id);



CREATE SEQUENCE teacher_seq
INCREMENT BY 100
MINVALUE 400

NOCYCLE
NOCACHE;



INSERT INTO my_teacher VALUES(teacher_seq.NEXTVAL, 'Aj.Del');



ALTER TABLE my_assignment
ADD a_status VARCHAR2(10);


ALTER TABLE my_assignment
MODIFY a_status VARCHAR2(30)
CHECK(a_status IN ('SUBMITTED', 'LATE', 'NOT_SUBMIT'));



UPDATE my_assignment
SET a_status = 'NOT_SUBMIT'
WHERE assign_id = 50004;



SELECT course_id
FROM my_assignment
WHERE a_status = 'NOT_SUBMIT';



CREATE VIEW my_view
AS SELECT course_id, assignment_name, due_date
   FROM my_assignment
   WHERE course_id = 'DAT-101' AND a_status = 'NOT_SUBMIT';
   

SELECT *
FROM my_view;