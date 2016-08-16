require_relative('../models/transaction')
require_relative('../models/user')
require_relative('../models/category')
require("pry-byebug")

require_relative('./application_controller')

before '/transactions' do
  require_user
end
before '/transactions/*' do
  require_user
end

#Index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end #Probably not necessary

#New
get '/transactions/new' do
  #@user = User.find(params[:id]) 
  #Not sure how to get user_id
  # binding.pry
  @current_user = current_user()
  @categories = Category.all()
  @merchants = Merchant.all()
  @user = User.find(@current_user.id)

  #@users = User.all()
  erb(:'transactions/new')
end

#Create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect(to("/transactions"))
end

#Show in analysis page
get '/transactions/analysis' do
  @current_user = current_user()
  @transactions = @current_user.transactions()
  @analysis = Analysis.new( @transactions )
  @total = @analysis.total
  # @transactions = @analysis.percent
  # binding.pry
  erb(:'/transactions/analysis')
end

#Show
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:'transactions/show')
end

#Edit
get '/transactions/:id/edit' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @transaction = Transaction.find(params[:id])
  erb(:'transactions/edit')
end

#Update
post '/transactions/:id' do
  @transaction = Transaction.update(params)
  redirect(to("/users/index"))
end

#Delete
post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect(to("/users/index"))
end


