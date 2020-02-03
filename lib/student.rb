class Student
  
  attr_accessor :name, :grade
  attr_reader :id 
  
    def initialize(id = nil, name, grade)
     @name = name
     @grade = grade
      @id = id
    end
  
    def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
  
  def self.drop_table
    sql =  <<-SQL 
      drop table students
        SQL
    DB[:conn].execute(sql) 
  end
  
  
    def save
    sql = <<-SQL
      INSERT INTO students (name, grade) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
    sql 
  end
  
  def self.create(:name, :grade)
    
  
end
