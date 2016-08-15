require_relative('./merchant')
require_relative('./user') #Need this?
require_relative('./transaction')
require_relative('./category')
require('pry-byebug')

class Analysis
  attr_reader(:users, :transactions, :merchants, :categories)

  def initialize( transactions )
    @transactions = transactions
  end

  def total_expenditure
    total = 0
    binding.pry
    for transaction in @transactions
      total += transaction.amount
    end
    return total
  end

  def filter_by_category( category_id )
    @transactions = @transactions.select do |transaction|
      transaction.category_id == category_id
    end
    return @transactions
  end

  def filter_by_merchant(merchant_id)
    @transactions = @transactions.select do |transaction|
      transaction.merchant_id == merchant_id
    end
    return @transactions
  end

  def total()
    return @transactions.reduce(0) { | sum, t | sum + t.amount }
  end
end