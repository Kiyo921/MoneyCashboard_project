require_relative('../models/user')
require_relative('../models/category')
require_relative('../models/analysis')
require_relative('./application_controller')
require('pry-byebug')

before '/users' do
  require_user
end

before '/users/*' do
  require_user
end

#Index by user
get "/users/:id" do
  @current_user = current_user()
  @transactions = @current_user.transactions()
  @analysis = Analysis.new( @transactions )

  @category_id = params[:category_id] && params[:category_id].to_i
  if @category_id
    @transactions = @analysis.filter_by_category( @category_id )
  end
  @categories = Category.all()
  
  @merchant_id = params[:merchant_id] && params[:merchant_id].to_i
  if @merchant_id
    @transactions = @analysis.filter_by_merchant( @merchant_id )
  end
  @merchants = Merchant.all()

  date_sort = params[:start_date] && params[:end_date]
  if date_sort
    @transactions = @analysis.filter_by_date( params[:start_date], params[:end_date] )
  end
  
  erb(:"users/index")
end

#Show
get '/users/:id/show' do
  @user = User.find(params[:id])
  erb(:'users/show')
end

#Edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:'users/edit')
end

#Update
post '/users/:id' do
  @user = User.update(params)
  redirect(to("/"))
end

#Delete
#not used in the app
post '/users/:id/delete' do
  @user = User.delete(params[:id])
  redirect(to("/users"))
end