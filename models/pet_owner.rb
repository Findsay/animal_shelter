require_relative "../db/sql_runner"

class PetOwner

  attr_reader :id

  attr_accessor :name, :picture, :type, :breed, :gender, :adoptable, :trained, :date_arrived


  def initialize(options)
    @id = options['id'] if options['id']
    @owner_id = options['owner_id']
    @pet_id = options['pet_id']
  end


  def save()
    sql = "INSERT INTO pet_owners (owner_id, pet_id) VALUES ($1, $2) RETURNING id;"
    values = [@owner_id, @pet_id]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  # def self.delete_all()
  #   sql = 'DELETE FROM pets;'
  #   values = []
  #   SqlRunner.run(sql, values)
  # end
  #
  # def update()
  #   sql = 'UPDATE pets SET (name, picture, type, breed, gender, date_arrived, adoptable, trained) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9;'
  #   values = [@name, @picture, @type, @breed, @gender, @date_arrived, @adoptable, @trained, @id]
  #   SqlRunner.run(sql, values)
  # end
  #
  # def delete()
  #   sql = 'DELETE FROM pets WHERE id = $1;'
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  # end
  #
  # def self.all()
  #   sql = 'SELECT * FROM pets;'
  #   values = []
  #   pets = SqlRunner.run(sql, values)
  #   return pets.map { |pet| Pet.new(pet) }
  # end
  #
  # def self.find(id)
  #     sql = 'SELECT * FROM pets WHERE id = $1'
  #     values = [id]
  #     pet = SqlRunner.run(sql, values).first()
  #     return Pet.new(pet)
  # end

end
