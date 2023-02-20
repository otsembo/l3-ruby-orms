class Student
    attr_accessor :name, :age, :id

    def initialize(name:, age:, id: nil)
        @id=id
        @name=name
        @age=age
    end

# TODO: CREATE TABLE
    def self.create_table

        query = "CREATE TABLE IF NOT EXISTS students (name VARCHAR(255) NOT NULL, age INTEGER NOT NULL)"

        DB[:conn].query(query)

    end

# TODO: INSERT RECORD
    def create
        query = <<-SQL
            INSERT INTO students (name, age) VALUES (?, ?)
        SQL

        DB[:conn].query(query, self.name, self.age)
    end 

# TODO: SHOW ALL RECORDS
    def self.all

        query = <<-SQL
            SELECT * FROM students
        SQL

        DB[:conn].query(query).each do |row|
            pp row
        end

    end

# TODO: UPDATE RECORD
    def update

        query = <<-SQL
            UPDATE students SET name = ?, age = ? WHERE name = ?
        SQL

        DB[:conn].query(query, self.name, self.age, self.name)

    end

# TODO: DELETE RECORD
    def destroy
        query = <<-SQL 
            DELETE FROM students WHERE name = ?
        SQL

        DB[:conn].query(query, self.name)
    end

# TODO: CONVERT TABLE RECORD TO RUBY OBJECT

# TODO: SEARCH FOR RECORD THAT MEETS CERTAIN CONDITIONS

end
