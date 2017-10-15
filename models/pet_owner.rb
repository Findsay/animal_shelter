require_relative "../db/sql_runner"

class PetOwner

  attr_reader :id

  attr_accessor :owner_id, :pet_id


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

  def self.delete_all()
    sql = 'DELETE FROM pet_owners;'
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = 'UPDATE pet_owners SET (owner_id, pet_id) = ($1, $2) WHERE id = $3;'
    values = [@owner_id, @pet_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM pet_owners WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM pet_owners;'
    values = []
    pet_owners = SqlRunner.run(sql, values)
    return pet_owners.map { |pet_owner| PetOwner.new(pet_owner) }
  end

end
