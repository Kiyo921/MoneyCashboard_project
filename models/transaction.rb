require('pg')
require_relative('../db/sql_runner')
require_relative('./user')

class Transaction
  
  attr_reader(:id, :amount, :memo, :dates, :user_id, :category_id)

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @memo = options['memo']
    @dates = options['dates'].to_i
    @user_id = options['user_id'].to_i
    @category_id = options['category_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (amount, memo, dates, user_id, category_id)
          VALUES ('#{@amount}', '#{memo}', '#{dates}', '#{user_id}', '#{category_id}') RETURNING *;"
    transaction = SqlRunner.run(sql).first
    @id = transaction['id'] 
  end

  def user ### necessary??
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    Transaction.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    Transaction.map_item(sql)
  end

  def self.update(options) ## amount '' necessary?
    sql = "UPDATE transactions SET
            amount = #{options['amount']},
            memo = '#{options['memo']}',
            dates = '#{options['dates']}',
            user_id = #{options['user_id']},
            category_id = #{options['category_id']}
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
  end

  def self.map_items(sql) ## Can I use this in user class as well?
    transactions= SqlRunner.run(sql)
    result = transactions.map{|transaction| Transaction.new(transaction)}
    return result
  end

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end
end