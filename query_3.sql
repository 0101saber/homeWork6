select AVG(j.rate) as rate_avg, g.name
from groups g
    left join students s on g.id = s.group_id
    left join journal j on s.id = j.student_id
where j.subject_id = 1
    group by g.id

--     Знайти середній бал у групах з певного предмета.
