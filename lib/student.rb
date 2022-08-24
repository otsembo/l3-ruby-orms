class Student
    attr_accessor :name, :age, :id

    def initialize(name:, age:, id: nil)
        @id=id
        @name=name
        @age=age
    end

# TODO: CREATE TABLE
    def self.create_table()
        query = <<-SQL
            CREATE TABLE if not exists students(
                id INTEGER PRIMARY KEY,
                name TEXT,
                age INTEGER
            )
        SQL
        DB[:conn].execute(query)
    end

# TODO: INSERT RECORD
    def add_to_db
        query = <<-SQL
            INSERT INTO students(name, age) VALUES (?, ?)
        SQL
        DB[:conn].execute(query, self.name, self.age)
        set_id
    end

# TODO: SHOW ALL RECORDS
    def self.show_all
        query = <<-SQL
            SELECT * FROM students
        SQL
        DB[:conn].execute(query).map do |row|
            object_from_db(row)
        end 
    end

    # SHOW PREVIOUSLY ADDED RECORD
    # def show_most_recent
    #     query = <<-SQL
    #         SELECT * FROM students ORDER BY id DESC LIMIT 1
    #     SQL
    #     DB[:conn].execute(query)map do |row|
    #         Student.object_from_db(row)
    #     end.first
    # end

# TODO: UPDATE RECORD
    def update_student
        query = <<-SQL
            UPDATE students SET name = ?, age = ? where id = ?
        SQL
        DB[:conn].execute(query, self.name, self.age, self.id)
    end

# TODO: DELETE RECORD
    def delete_student
        query = <<-SQL
            DELETE FROM students WHERE id = ?
        SQL
        DB[:conn].execute(query, self.id)
    end

# TODO: CONVERT TABLE RECORD TO RUBY OBJECT
    def self.object_from_db(row)
        self.new(name: row[1],age: row[2], id: row[0])
    end

# TODO: SEARCH FOR RECORD THAT MEETS CERTAIN CONDITIONS

    private    

    def set_id
      query = "SELECT last_insert_rowid() FROM students"
      retrieved_id = DB[:conn].execute(query)
      self.id = retrieved_id[0][0]
    end

end
