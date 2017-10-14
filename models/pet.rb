require_relative "../db/sql_runner"

class Pet

  def initialize(options)
    @name = options['name']
    @picture = options['picture']
    @type = options['type']
    @breed = options['breed']
    @gender = options['gender']
    @date_arrived = options['date_arrived']
    @adoptable = options['adoptable']
    @trained = options['trained']
    # @owner_id = options['owner_id']

  end


  def save()
    sql = "INSERT INTO pets (name, picture, type, breed, gender, date_arrived, adoptable, trained) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id;"
    values = [@name, @picture, @type, @breed, @gender, @date_arrived, @adoptable, @trained]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all()
      sql = 'DELETE FROM pets;'
      values = []
      SqlRunner.run(sql, values)
  end

  # def update()
  #     sql = 'UPDATE students SET (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) WHERE id = $5;'
  #     values = [@first_name, @last_name, @house_id, @age, @id]
  #     SqlRunner.run(sql, values)
  # end
  #
  # def delete()
  #     sql = 'DELETE FROM students WHERE id = $1;'
  #     values = [@id]
  #     SqlRunner.run(sql, values)
  # end
  #
  # def self.all()
  #     sql = 'SELECT * FROM students;'
  #     values = []
  #     students = SqlRunner.run(sql, values)
  #     return students.map { |student| Student.new(student) }
  # end
  #
  # def self.find(id)
  #     sql = 'SELECT * FROM students WHERE id = $1'
  #     values = [id]
  #     student = SqlRunner.run(sql, values).first()
  #     return Student.new(student)
  # end
end
