require('pg')
require_relative('../db/sql_runner')

class Auth
  # We'll validate some of the attributes of our user by writing code that makes sure no one can sign up without inputing their name, email and password. More on this later.
  attr_reader(:id, :name, :email, :password)
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @email = options['email']
    @password = options['password']
  end

  def save()
    sql = "INSERT INTO auths (name, email, password) VALUES ('#{@name}', '#{@email}', '#{@password}') RETURNING *;"
    auth = SqlRunner.run(sql).first
    @id = auth['id']
  end

  def self.find(id)
    sql = "SELECT * FROM auths WHERE id = #{id};"
    Auth.map_item(sql)
  end

  def self.find_by(email, password)
    sql = "SELECT * FROM auths WHERE email = '#{email}' AND password = '#{password}';"
    Auth.map_item(sql)
  end

  def self.map_items(sql)
    auths= SqlRunner.run(sql)
    result = auths.map{|auth| Auth.new(auth)}
    return result
  end

  def self.map_item(sql)
    result = Auth.map_items(sql)
    return result.first
  end


end 