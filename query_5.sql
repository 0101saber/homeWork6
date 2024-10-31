select s.name, t.first_name, t.last_name
from subjects s
left join teachers t on s.teacher_id = t.id


--     Знайти які курси читає певний викладач.




