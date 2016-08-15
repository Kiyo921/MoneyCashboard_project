require_relative('./merchant')
require_relative('./user') #Need this?
require_relative('./transaction')
require_relative('./category')
require('pry-byebug')

class Analysis
  attr_reader(:users, :transactions, :merchants, :categories)

  def initialize ()
    @users = User.all
    @transactions = Transaction.all
    @merchants = Merchant.all
    @categories = Category.all
    # user1.transactions 
  end

  def total_expenditure
    total = 0
    binding.pry
    for transaction in @transactions
      total += transaction.amount
    end
    return total
  end

  def total_expenditure_by_category
    
  end

  def total_expenditure_by_date
  end

end