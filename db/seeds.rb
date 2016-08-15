require('pry-byebug')
require_relative('../models/user')
require_relative('../models/transaction')
require_relative('../models/category')

User.delete_all()
Category.delete_all()
Transaction.delete_all()

user1 = User.new({'name' => 'user1', 'email' => 'user1@gmail.com', 'password' => 'user1'})
user2 = User.new({'name' => 'user2', 'email' => 'user2@gmail.com', 'password' => 'user2'})
user3 = User.new({'name' => 'user3', 'email' => 'user3@gmail.com', 'password' => 'user3'})
user4 = User.new({'name' => 'user4', 'email' => 'user4@gmail.com', 'password' => 'user4'})

user1.save
user2.save
user3.save
user4.save

food = Category.new('category_name' => 'Food', 'logo' => 'Food' )
daily_goods = Category.new('category_name' => 'Daily goods', 'logo' => 'Daily goods' )
transport = Category.new('category_name' => 'Transport', 'logo' => 'Transport' )
socializing = Category.new('category_name' => 'Socializing', 'logo' => 'Socializing' )

food.save
daily_goods.save
transport.save
socializing.save

transaction1 = Transaction.new('amount' => 100, 'memo' => 'Food', 'dates' => 'Yesterday', 'user_id' => user1.id, 'category_id' => food.id)
transaction2 = Transaction.new('amount' => 100, 'memo' => 'Daily goods', 'dates' => 'Yesterday', 'user_id' => user1.id, 'category_id' => daily_goods.id)
transaction3 = Transaction.new('amount' => 100, 'memo' => 'Transport', 'dates' => 'Yesterday', 'user_id' => user1.id, 'category_id' => transport.id)
transaction4 = Transaction.new('amount' => 100, 'memo' => 'Socializing', 'dates' => 'Yesterday', 'user_id' => user2.id, 'category_id' => socializing.id)

transaction1.save
transaction2.save
transaction3.save
transaction4.save


binding.pry
nil