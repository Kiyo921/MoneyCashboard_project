require_relative('../models/category')
require_relative('./application_controller')

before '/categories' do
  require_user
end

before '/users/*' do
  require_user
end

#Index
get "/categories" do
  @categories = Category.all
  erb(:"categories/index")
end

#Transactions by categories
