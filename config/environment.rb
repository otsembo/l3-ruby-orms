require 'bundler'
Bundler.require

DB = { conn: SQLite3::Database.new("db/school.db") }
require_relative '../lib/student'


# RUN CODE FROM HERE
# create table
Student.create_table

# student data
ian = Student.new(age: 12, name: "Student")
# insert record
ian.create

# view all students
Student.all

# update student data
# ian.name = "Ian"
ian.age = 90
ian.update

Student.all

ian.destroy

Student.all
