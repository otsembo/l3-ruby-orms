require 'bundler'
Bundler.require

DB = { conn: SQLite3::Database.new("db/school.db") }
require_relative '../lib/student'


# RUN CODE FROM HERE
# reset table
Student.reset

# create table
Student.create_table

# create student data
s1 = Student.new(name: "Jane Doe", age: 28)
s2 = Student.new(name: "John Doe", age: 40)
s3 = Student.new(name: "Albert Byrone", age: 50)

# save student data
s1.create
s2.create
s3.create

# check student
pp "Student 1: #{s1}"

# view student data
pp Student.all

print "SEARCH RESULTS: "
pp Student.search_by(name: "Doe")


