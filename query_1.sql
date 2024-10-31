SELECT students.id, students.first_name, students.last_name, ROUND(AVG(journal.rate), 2) as rate_student
FROM students
left join journal on students.id = journal.student_id
group by journal.student_id
ORDER BY rate_student
    limit 5

-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
