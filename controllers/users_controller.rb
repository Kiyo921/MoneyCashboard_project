require_relative('../models/user')
require_relative('../models/category')
require_relative('./application_controller')
require('pry-byebug')

before '/users' do
  require_user
end

before '/users/*' do
  require_user
end ### Any way I could combine them together??

# #Index
# get "/users" do
#   @users = User.all
#   erb(:"users/index")
#   ## Probably not necessary
# end

#Index by user
get "/users/:id" do
  # @user = User.find(params[:id])
  puts "in users id"
  @current_user = current_user()
  @transactions = @current_user.transactions()
  @category_id = params[:category_id] && params[:category_id].to_i
  if @category_id
    @transactions = @transactions.select do |transaction|
      transaction.category_id == @category_id
    end
  end

  @categories = Category.all()
  erb(:"users/index")
end

# Index by category and filter
# get "/users/filter_by_category" do
  # @current_user = current_user()
  # @transactions = @current_user.transactions
  # @categories = Category.all()
  # erb(:"users/index")
# end 

#New
get '/users/new' do
  erb(:'users/new')
end

#Create
post '/users' do
  @user = User.new(params)
  @user.save
  redirect(to("/users"))
end

 # same as register

# #Show
# get '/users/:id' do
#   @user = User.find(params[:id])
#   erb(:'users/show')
# end

#Edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:'users/edit')
end

#Update
post '/users/:id' do
  @user = User.update(params)
  redirect(to("/users/#{params[:id]}"))
end

#Delete
post '/users/:id/delete' do
  @user = User.delete(params[:id])
  redirect(to("/users"))
end