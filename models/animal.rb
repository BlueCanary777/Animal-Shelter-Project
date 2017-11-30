require_relative('../db/sql_runner')
require_relative('../models/owner')

require('pry')

class Animal

  attr_accessor :id, :name, :admission_date, :adoptable, :owner_id


  def initialize (animal_hash)
    @id = animal_hash['id'].to_i
    @name = animal_hash['name']
    @admission_date = animal_hash['admission_date']
    @adoptable = animal_hash['adoptable']
    @owner_id = animal_hash['owner_id'] if animal_hash['owner_id']
  end

  def save()
    sql = "INSERT INTO animals
    (name, admission_date, adoptable, owner_id)
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values = [@name, @admission_date, @adoptable, @owner_id]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

  def Animal.change_adoptability(id, adoptable)
    sql = "UPDATE animals SET adoptable = $1 WHERE id = $2"
    values = [adoptable, id]
    SqlRunner.run(sql, values)
  end

  def Animal.all()
    sql = "SELECT * FROM animals"
    values = []
    animals = SqlRunner.run(sql, values)
    result = animals.map {|animal| Animal.new(animal)}
    return result
  end

  def Animal.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal = SqlRunner.run( sql, values )
    result = Animal.new( animal.first )
    return result
  end

  def update()
    sql ="UPDATE animals SET
    (name, admission_date, adoptable, owner_id) = ($1, $2, $3, $4)
    WHERE ID = $5"
    values = [@name, @admission_date, @adoptable, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  # Write method to bring back an owner object for an animal

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    owner_data = SqlRunner.run( sql, values ).first
    result = Owner.new(owner_data)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  


end
