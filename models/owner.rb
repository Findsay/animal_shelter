require_relative "../db/sql_runner"
require_relative "pet"

class Owner

  attr_accessor :name, :email, :mobile
  attr_reader :id


  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @email = options['email']
    @mobile = options ['mobile']
  end


  def save()
    sql = "INSERT INTO owners (name, email, mobile) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @email, @mobile]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM owners;'
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = 'UPDATE owners SET (name, email, mobile) = ($1, $2, $3) WHERE id = $4;'
    values = [@name, @email, @mobile, @id]
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
    sql = 'SELECT * FROM owners WHERE id = $1;'
    values = [id]
    owner = SqlRunner.run(sql,values).first
    return Owner.new(owner)
  end

  def self.count()
    sql = "SELECT COUNT (*) FROM owners;"
    values =[]
    return SqlRunner.run(sql, values)[0]['count'].to_i
  end


  def no_adopted()
    sql = "SELECT COUNT(*) FROM pet_owners WHERE owner_id= $1;"
    values =[@id]
    return SqlRunner.run(sql, values)[0]['count'].to_i
  end

  def self.avg_pets()
    pets = []
    owners = Owner.all
    for owner in owners
      if owner.no_adopted > 0
        pets << owner.no_adopted
      end
    end
    sum = (pets.sum)+0.0
    return average = sum/pets.count
  end
end
