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

end
