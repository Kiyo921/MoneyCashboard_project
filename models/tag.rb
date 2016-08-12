require('pg')
require_relative('../db/sql_runner')
require_relative('./transaction')

class Tag
  attr_reader(:id, :tag_name, :transaction_id)
  def initialize(options)
    @id = options['id'].to_i
    @tag_name = options['tag_name']
    @transaction_id = options['transaction_id'].to_i
  end

  def save()
    sql = "INSERT INTO tags (tag_name, transaction_id) VALUES('#{@tag_name}', '#{@transaction_id}') RETURNING *;"
    tag = SqlRunner.run(sql).first
    id = tag['id']
  end

  def self.all()
    sql = "SELECT * FROM tags;"
    Tag.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{ids};"
    Tag.map_item(sql)
  end

  def transactions()

  end

  def self.update(options)
  end

  def self.delete(id)
  end

  def self.map_items(sql)
    tags = SqlRunner.run(sql)
    result = tags.map{|tag| Tag.new(tag)}
    return result
  end

  def self.map_item(sql)
    result = Tag.map_items(sql)
    return result.first
  end

end