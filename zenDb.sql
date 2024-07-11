CREATE DATABASE zenclass;
SHOW DATABASES;
USE zenclass;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
date_of_birth VARCHAR(50),
email VARCHAR (100),
address TEXT,
phone_number INT,
qualification VARCHAR(255),
user_id INT ,
batch_id INT,
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (batch_id) REFERENCES batches (batch_id)
);

CREATE TABLE batches (
batch_id INT PRIMARY KEY,
batch_name VARCHAR (50),
start_sate DATE,
end_date DATE,
course_id INT,
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
description_of TEXT,
duration VARCHAR (100));

CREATE TABLE mentors(
mentor_id INT PRIMARY KEY,
mentor_name VARCHAR (100),
address TEXT,
email VARCHAR(50),
phone_number INT,
qualification VARCHAR (255),
experience VARCHAR (255),
batch_id INT,
specialization VARCHAR(255),
FOREIGN KEY (batch_id) REFERENCES batches (batch_id));

CREATE TABLE sessions(
session_id INT PRIMARY KEY,
topic_name VARCHAR(100),
description_of_topic TEXT,
start_time TIME ,
end_time TIME,
mentor_id INT,
FOREIGN KEY (mentor_id) REFERENCES mentors (mentor_id)  );

CREATE TABLE task (
task_id INT PRIMARY KEY,
task_name VARCHAR(100),
description_of TEXT,
status_of VARCHAR(100),
deadline DATE,
mentor_id INT,
student_id INT,
session_id INT,
FOREIGN KEY (mentor_id) REFERENCES mentors (mentor_id),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (session_id) REFERENCES sessions (session_id)   
);

CREATE TABLE queries(
query_id INT PRIMARY KEY,
student_id INT,
mentor_id INT,
question VARCHAR(255),
answer TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
status_of VARCHAR(50),
FOREIGN KEY (mentor_id) REFERENCES mentors (mentor_id),
FOREIGN KEY (student_id) REFERENCES students (student_id)
);

CREATE TABLE attendence (
attendence_id INT PRIMARY KEY,
student_id INT ,
session_id INT,
date_ DATE,
percentage VARCHAR(10),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);

CREATE TABLE capstone(
cap_id INT PRIMARY KEY,
project_name VARCHAR (100),
description_of TEXT,
student_id INT,
FOREIGN KEY(student_id) REFERENCES students (student_id)
);

CREATE TABLE portfolio(
port_id INT PRIMARY KEY,
student_id INT,
cap_id INT,
attendence_id INT,
submission_date DATE,
github_url VARCHAR(255),
portfolio_url VARCHAR (255),
resume_url VARCHAR(255),
FOREIGN KEY(student_id) REFERENCES students (student_id),
FOREIGN KEY (cap_id) REFERENCES capstone (cap_id),
FOREIGN KEY (attendence_id) REFERENCES attendence(attendence_id)

);


