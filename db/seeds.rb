require('pry-byebug')
require_relative('../models/user')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')

User.delete_all()
Category.delete_all()
Transaction.delete_all()
Merchant.delete_all()

user1 = User.new({'name' => 'user1', 'email' => 'user1@gmail.com', 'password' => 'user1'})
user2 = User.new({'name' => 'user2', 'email' => 'user2@gmail.com', 'password' => 'user2'})
user3 = User.new({'name' => 'user3', 'email' => 'user3@gmail.com', 'password' => 'user3'})
user4 = User.new({'name' => 'user4', 'email' => 'user4@gmail.com', 'password' => 'user4'})

user1.save
user2.save
user3.save
user4.save

food = Category.new('category_name' => 'Food')
daily_goods = Category.new('category_name' => 'Daily goods')
transport = Category.new('category_name' => 'Transport')
socializing = Category.new('category_name' => 'Socializing')
hobbies = Category.new('category_name' => 'Hobbies')
education = Category.new('category_name' => 'Education')
fashion = Category.new('category_name' => 'Fashion')
medical = Category.new('category_name' => 'Medical')
phone_internet = Category.new('category_name' => 'Phone, Internet')
utilities = Category.new('category_name' => 'Utilities')
home = Category.new('category_name' => 'Home')
automobile = Category.new('category_name' => 'Automobile')
taxes = Category.new('category_name' => 'Taxes')
big_outlay = Category.new('category_name' => 'Big outlay')
other = Category.new('category_name' => 'Other')

food.save
daily_goods.save
transport.save
socializing.save
hobbies.save
education.save
fashion.save
medical.save
phone_internet.save
utilities.save
home.save
automobile.save
taxes.save
big_outlay.save
other.save

tesco = Merchant.new('merchant_name' => 'Tesco')
boots = Merchant.new('merchant_name' => 'Boots')
sainsbary = Merchant.new('merchant_name' => 'Sainsbary')
hmsmith = Merchant.new('merchant_name' => 'HM Smith')

tesco.save
boots.save
sainsbary.save
hmsmith.save

transaction1 = Transaction.new('amount' => 100, 'memo' => 'Food', 'dates' => '12-10-2016', 'user_id' => user1.id, 'category_id' => food.id, 'merchant_id' =>tesco.id)
transaction2 = Transaction.new('amount' => 100, 'memo' => 'Daily goods', 'dates' => '12-11-2016', 'user_id' => user1.id, 'category_id' => daily_goods.id, 'merchant_id' =>tesco.id)
transaction3 = Transaction.new('amount' => 100, 'memo' => 'Transport', 'dates' => '12-09-2016', 'user_id' => user1.id, 'category_id' => transport.id, 'merchant_id' =>tesco.id)
transaction4 = Transaction.new('amount' => 100, 'memo' => 'Socializing', 'dates' => '12-12-2016', 'user_id' => user2.id, 'category_id' => socializing.id, 'merchant_id' =>tesco.id)

transaction1.save
transaction2.save
transaction3.save
transaction4.save


binding.pry
nil