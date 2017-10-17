require_relative "../db/sql_runner"
require_relative "owner"
require_relative "pet_owner"

class Pet

  attr_reader :id

  attr_accessor :name, :picture, :type, :breed, :gender, :adoptable, :trained, :date_arrived


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

  def self.find(id)
    sql = 'SELECT * FROM pets WHERE id = $1'
    values = [id]
    pet = SqlRunner.run(sql, values).first()
    return Pet.new(pet)
  end

  def self.trained(trained)
    sql = 'SELECT * FROM pets WHERE trained = $1'
    values = [trained]
    pets = SqlRunner.run(sql, values)
    return pets.map { |pet| Pet.new(pet)}
  end

  def owner()
    sql = "SELECT * FROM pet_owners WHERE pet_id = $1"
    values = [@id]
    petowner = SqlRunner.run(sql,values)
    if petowner.any?
      result = PetOwner.new(petowner.first())
      return Owner.find(result.owner_id).name
    else
      return "No Owner"
    end
  end

  def self.search(input)
    sql = "SELECT * FROM pets WHERE type = $1;"
    values = [input.downcase.capitalize]
    pets = SqlRunner.run(sql, values)
    if pets.any?
      return pets.map { |pet| Pet.new(pet)}
    else
      sql = "SELECT * FROM pets WHERE breed = $1"
      values = [input.downcase.capitalize]
      pets = SqlRunner.run(sql, values)
      if pets.any?
        return pets.map { |pet| Pet.new(pet)}
      else
        return "Sorry there are no pets of that type or breed"
      end

    end

  end

  def self.count_all()
    sql = "SELECT COUNT (*) FROM pets;"
    values =[]
    return SqlRunner.run(sql, values)[0]['count'].to_i()
  end

  def self.count_type(type)
    sql = "SELECT COUNT(*) FROM pets WHERE type= $1;"
    values =[type.downcase.capitalize]
    return SqlRunner.run(sql, values)[0]['count'].to_i()
  end

  def self.adoption_percentage()
    total = Pet.count_all + 0.0
    adopted = PetOwner.count
    return ((adopted/total)*100).round
  end

  def self.pet_percentage(type)
    total = Pet.count_all + 0.0
    pet_type_total = Pet.count_type(type)
    return ((pet_type_total/total)*100).round
  end




end
