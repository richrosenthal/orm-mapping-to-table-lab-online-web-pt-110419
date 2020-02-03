class Student
  
  attr_accessor :name, :grade, :id
  
  def intiialize (name, grade)
    @name = name
    @grade = grade
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
  
    def save
    sql = <<-SQL
      INSERT INTO songs (name, grade) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
 
  end
  
end
