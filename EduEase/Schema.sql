CREATE DATABASE IF NOT EXISTS user_db;
USE user_db;

-- ----------------------------
-- User Table
-- ----------------------------
CREATE TABLE user_db (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    dept VARCHAR(100),
    role ENUM('admin', 'teacher', 'user') NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (email)
);

-- ----------------------------
-- Students
-- ----------------------------
CREATE TABLE students (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    roll_no VARCHAR(50) NOT NULL,
    sem INT NOT NULL,
    sub1 INT,
    sub2 INT,
    sub3 INT,
    sub4 INT,
    sub5 INT,
    sub6 INT,
    mid1 INT,
    mid2 INT,
    SGPA FLOAT,
    CGPA FLOAT,
    number VARCHAR(15),
    PRIMARY KEY (id),
    UNIQUE KEY (roll_no)
);

-- ----------------------------
-- Subjects
-- ----------------------------
CREATE TABLE subjects (
    id INT NOT NULL AUTO_INCREMENT,
    teacher_id INT NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_subject_teacher
        FOREIGN KEY (teacher_id)
        REFERENCES user_db(id)
        ON DELETE CASCADE
);

-- ----------------------------
-- Marks
-- ----------------------------
CREATE TABLE marks (
    id INT NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks INT NOT NULL,
    PRIMARY KEY (id),
    KEY (student_id),
    KEY (subject_id),
    CONSTRAINT fk_marks_student
        FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_marks_subject
        FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
        ON DELETE CASCADE
);

-- ----------------------------
-- Feedback
-- ----------------------------
CREATE TABLE feedback (
    id INT NOT NULL AUTO_INCREMENT,
    teacher_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- ----------------------------
-- Chat Messages
-- ----------------------------
CREATE TABLE chat_messages (
    id INT NOT NULL AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- ----------------------------
-- Student Profiles
-- ----------------------------
CREATE TABLE student_profiles (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    roll VARCHAR(50),
    section VARCHAR(20),
    college VARCHAR(150),
    cgpa FLOAT,
    backlogs INT,
    father VARCHAR(100),
    mother VARCHAR(100),
    inter_percent FLOAT,
    inter_college VARCHAR(150),
    inter_board VARCHAR(100),
    hobbies TEXT,
    skills TEXT,
    goals TEXT,
    profile_photo VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (email)
);
