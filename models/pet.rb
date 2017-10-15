require_relative "../db/sql_runner"
require_relative "owner"

class Pet

  attr_reader :id

  attr_accessor :name, :picture, :type, :breed, :gender, :adoptable, :trained, :date_arrived, :current_owner


  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @picture = options['picture']
    @type = options['type']
    @breed = options['breed']
    @gender = options['gender']
    @date_arrived = options['date_arrived']
    @adoptable = options['adoptable']
    @trained = options['trained']
    @current_owner = options['current_owner'] if options['current_owner']

  end


  def save()
    sql = "INSERT INTO pets (name, picture, type, breed, gender, date_arrived, adoptable, trained, current_owner) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id;"
    values = [@name, @picture, @type, @breed, @gender, @date_arrived, @adoptable, @trained, @current_owner]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM pets;'
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = 'UPDATE pets SET (name, picture, type, breed, gender, date_arrived, adoptable, trained, current_owner) = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10;'
    values = [@name, @picture, @type, @breed, @gender, @date_arrived, @adoptable, @trained,@current_owner, @id]
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

  def self.find(id)
      sql = 'SELECT * FROM pets WHERE id = $1'
      values = [id]
      pet = SqlRunner.run(sql, values).first()
      return Pet.new(pet)
  end

  def owner_name()
  sql = "SELECT * FROM owners WHERE id = $1"
  values = [@current_owner]
  owner = SqlRunner.run(sql, values).first()
  return Owner.new(owner).name()
  end

end
