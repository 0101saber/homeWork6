from datetime import datetime, timedelta
import faker
from random import randint, choice
import sqlite3

NUMBER_STUDENTS = 50
NUMBER_GROUPS = 3
NUMBER_TEACHER = 5
NUMBER_SUBJECTS = 5
NUMBER_STUDENTS_JOURNAL = 20


def generate_fake_data():
    fake_students = []
    fake_groups = [('D1', ), ('D2', ), ('D3', )]
    fake_teachers = []
    fake_subjects = ['Literature', 'Physics', 'Chemistry', 'Biology', 'Geography', 'History']

    fake_data = faker.Faker()

    for _ in range(NUMBER_STUDENTS):
        fake_students.append([fake_data.first_name(), fake_data.last_name()])
    for _ in range(NUMBER_TEACHER):
        fake_teachers.append((fake_data.first_name(), fake_data.last_name()))

    return fake_students, fake_groups, fake_teachers, fake_subjects


def prepare_data(students, groups, teachers, subjects):
    for_students = []

    for student in students:
        for_students.append((student[0], student[1],
                             datetime(randint(1960, 2006), randint(1, 12), randint(1, 28)).date().strftime('%Y-%m-%d'),
                             randint(1, NUMBER_GROUPS)))

    for_subjects = []

    for sub in subjects:
        for_subjects.append((sub, randint(1, NUMBER_TEACHER)))

    for_journal = []

    start_date = datetime(datetime.now().year, 1, 1)
    end_date = datetime(datetime.now().year, 12, 31, 23, 59, 59)

    for student in range(1, NUMBER_STUDENTS + 1):
        for _ in range(NUMBER_STUDENTS_JOURNAL):
            random_seconds = randint(0, int((end_date - start_date).total_seconds()))
            random_date = start_date + timedelta(seconds=random_seconds)

            for_journal.append((student, randint(1, NUMBER_SUBJECTS),
                                randint(1, 12), random_date.strftime('%Y-%m-%d %H:%M:%S')))

    return for_students, groups, teachers, for_subjects, for_journal


def insert_data_to_db(students, groups, teachers, subjects, journal) -> None:

    with sqlite3.connect('school.db') as con:

        cur = con.cursor()

        sql_to_groups = """INSERT INTO groups(name)
                               VALUES (?)"""

        cur.executemany(sql_to_groups, groups)

        sql_to_subjects = """INSERT INTO subjects(name, teacher_id)
                                 VALUES (?,?)"""

        cur.executemany(sql_to_subjects, subjects)

        sql_to_students = """INSERT INTO students(first_name, last_name, birthday, group_id)
                               VALUES (?,?,?,?)"""

        cur.executemany(sql_to_students, students)

        sql_to_teachers = """INSERT INTO teachers(first_name, last_name)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_teachers, teachers)

        sql_to_journal = """INSERT INTO journal(student_id, subject_id, rate, created_at)
                              VALUES (?, ?, ?, ?)"""

        cur.executemany(sql_to_journal, journal)
        con.commit()


if __name__ == "__main__":
    insert_data_to_db(*prepare_data(*generate_fake_data()))

