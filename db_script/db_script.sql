CREATE DATABASE attendence_system

USE attendence_system

CREATE TABLE user_type(
type_id int not null,
name varchar(255) NOT NULL,
PRIMARY KEY(type_id)
)

CREATE TABLE sys_users(
user_id int NOT NULL AUTO_INCREMENT,
username VARCHAR(255) NOT NULL,
fullname VARCHAR(255) NOT NULL,
email VARCHAR(255) DEFAULT NULL,
user_type int NOT NULL comment '1 = system,2 = application User',
pass VARCHAR(255) NOT NULL,
PRIMARY KEY(user_id),
CONSTRAINT fk_sys_users FOREIGN KEY(user_type) REFERENCES user_type(type_id)

)
Drop TABLE `role`

CREATE TABLE role(
role_id int NOT NULL AUTO_INCREMENT,
role_name VARCHAR(50),
PRIMARY KEY(role_id)
)

CREATE TABLE user_role(
urole_id int NOT NULL AUTO_INCREMENT,
user_id int NOT NULL,
role_id int NOT NULL,
PRIMARY KEY(urole_id),
CONSTRAINT fk_user_role_user_id FOREIGN KEY(user_id) REFERENCES sys_users(user_id),
CONSTRAINT fk_user_role_role_id FOREIGN KEY(role_id) REFERENCES role(role_id)
)

CREATE TABLE student(
st_id int NOT NULL AUTO_INCREMENT,
st_roll int NOT NULL,
st_name varchar(255) not NULL,
class int NOT NULL,
session_year int NOT NULL,
created_at timestamp,
PRIMARY KEY(st_id)
)

CREATE TABLE student_record(
record_id int NOT NULL AUTO_INCREMENT,
st_id int NOT NULL,
st_roll int NOT NULL,
class int NOT NULL,
session_year int NOT NULL,
created_at timestamp,
PRIMARY KEY(record_id)
)

CREATE TABLE attendance(
attendance_id int NOT NULL AUTO_INCREMENT,
student_id int NOT NULL,
attendance_date Date NOT NULL,
created_at timestamp,
PRIMARY KEY(attendence_id),
CONSTRAINT fk_attendance_student_id FOREIGN KEY(student_id) REFERENCES student(st_id)
)









