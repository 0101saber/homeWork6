select s.first_name, s.last_name, j.rate
from students s
left join journal j on s.id = j.student_id
where subject_id = 1 and s.group_id = 1

--     Знайти оцінки студентів у окремій групі з певного предмета.