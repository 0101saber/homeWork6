select AVG(j.rate)
from journal j
left join subjects s on s.id = j.subject_id
where s.teacher_id = 1

--     Знайти середній бал, який ставить певний викладач зі своїх предметів.