require('pg')
require_relative('../db/sql_runner')
require_relative('./transaction')

class Merchant
  attr_reader(:id, :merchant_name, :transaction_id)
  def initialize(options)
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
    @transaction_id = options['transaction_id'].to_i
  end

  def save()
    sql = "INSERT INTO merchants (merchant_name, transaction_id) VALUES ('#{@merchant_name}', '#{@transaction_id}') RETURNING *;"
    merchant = SqlRunner.run(sql).first
    @id = merchant['id']
  end

  def self.all()
    sql = "SELECT * FROM merchants;"
    Merchant.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id};"
    Merchant.map_item(sql)
  end

  def transactions()
  end

  def self.update(options)
  end

  def self.delete(id)
  end

  def self.map_items(sql)
    merchants = SqlRunner.run(sql)
    result = merchants.map {|merchant| Merchant.new(merchant)}
    return result
  end

  def self.map_item(sql)
    result = Merchant.map_items(sql)
    return result.first
  end

end