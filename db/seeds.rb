require('pry-byebug')
require_relative('../models/user')
require_relative('../models/transaction')

User.delete_all()
Transaction.delete_all()
Category.delete_all()


binding.pry
nil