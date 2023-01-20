-- Parte GROUP

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(id),enrolment_date 

FROM students 

GROUP BY enrolment_date;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(id),office_address

 FROM teachers 
 
 GROUP BY office_address;

--  3. Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(exam_student.vote) 

FROM exam_student;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(degree_id) 

FROM courses GROUP BY id;

-- Parte JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT degrees.name, students.* 

FROM degrees 

JOIN students 

ON degrees.id = students.degree_id 

WHERE degrees.name 

LIKE 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT * 

FROM departments 

JOIN degrees

 ON departments.id = degrees.id 

 WHERE departments.name 

 LIKE 'dipartimento di neuroscienze' 

 AND degrees.level LIKE'magistrale ';


--  3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT teachers.name,teachers.surname,course_teacher.* 

FROM teachers 

JOIN course_teacher
 
 ON teachers.id = course_teacher.teacher_id 
 
 JOIN courses 
 
 ON course_teacher.course_id = courses.id 
 
 WHERE teacher_id = '44';

--  4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.surname,students.name,degrees.*,departments.name

FROM students 

JOIN degrees

ON students.degree_id = degrees.id 

JOIN departments

ON degrees.department_id = departments.id

ORDER BY students.surname,students.name;
