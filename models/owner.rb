require_relative "../db/sql_runner"
require_relative "pet"

class Owner

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO owners (name) VALUES ($1) RETURNING id;"
    values = [@name]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM owners;'
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = 'UPDATE owners SET (name) = ($1) WHERE id = $2;'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM owners WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM owners;'
    values = []
    owners = SqlRunner.run(sql, values)
    return owners.map { |owner| Owner.new(owner) }
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE current_owner = $1"
    values[id]
    pets = SqlRunner.run(sql, vaues)
    return pets.map { |pet| Pet.new(pet)}

  end

end
