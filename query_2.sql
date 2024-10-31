select *, (select AVG(journal.rate)
            from journal
            where subject_id = 2 and student_id=students.id
            group by student_id) as rate_avg
from students
order by rate_avg DESC
limit 1

--     Знайти студента із найвищим середнім балом з певного предмета.
