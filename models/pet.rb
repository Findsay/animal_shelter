require_relative "../db/sql_runner"

class Pet

  attr_accessor :name, :picture, :type, :breed, :gender, :adoptable, :trained

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

  def update()
      sql = 'UPDATE pets SET (name, picture, type, breed, gender, date_arrived, adoptable, trained) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9;'
      values = [@name, @picture, @type, @breed, @gender, @date_arrived, @adoptable, @trained, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
      sql = 'DELETE FROM pets WHERE id = $1;'
      values = [@id]
      SqlRunner.run(sql, values)
  end

  def self.all()
      sql = 'SELECT * FROM pets;'
      values = []
      pets = SqlRunner.run(sql, values)
      return pets.map { |pet| Pet.new(pet) }
  end

end
