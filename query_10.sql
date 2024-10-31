select s.name
from subjects s
left join main.journal j on s.id = j.subject_id
where j.student_id = 1 AND s.teacher_id = 2
group by s.id

--     Список курсів, які певному студенту читає певний викладач.