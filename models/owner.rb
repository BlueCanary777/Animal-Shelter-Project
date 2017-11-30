require_relative('../db/sql_runner')

class Owner

  attr_accessor :id, :first_name, :last_name

  def initialize (owner_hash)
    @id = owner_hash['id'].to_i
    @first_name = owner_hash['first_name']
    @last_name = owner_hash['last_name']
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO owners
    (first_name, last_name)
    VALUES ($1, $2)
    RETURNING *"
    values = [@first_name, @last_name]
    owner_data = SqlRunner.run(sql, values)
    @id = owner_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Owner.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    owner = SqlRunner.run( sql, values )
    result = Owner.new( owners.first )
    return result
  end

  def Owner.all()
    sql = "SELECT * FROM owners"
    values = []
    owner = SqlRunner.run(sql, values)
    output = owner.map {|owner| Owner.new(owner)}
    return output
  end


  def animals
    sql = "SELECT * FROM animals
    WHERE owner_id = $1"
    values = [@id]
    animal_data = SqlRunner.run( sql, values )
    result = animal_data.map { |animal| Animal.new(animal) }
  end

end
