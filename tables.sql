-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthday DATE default NULL,
    group_id INTEGER default NULL,
    FOREIGN KEY (group_id) REFERENCES groups (id)
      ON DELETE SET NULL
      ON UPDATE SET NULL

);

-- Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table: journal
DROP TABLE IF EXISTS journal;
CREATE TABLE journal (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER,
    rate INTEGER,
    created_at DATETIME default current_timestamp,
    FOREIGN KEY (student_id) REFERENCES students (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
