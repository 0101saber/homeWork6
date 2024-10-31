select s.name
from subjects s
left join main.journal j on s.id = j.subject_id
where j.student_id = 1
group by s.id

--     Знайти список курсів, які відвідує студент.