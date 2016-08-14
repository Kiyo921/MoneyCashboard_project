require_relative('../models/user')
require_relative('./application_controller')

before '/users' do
  require_user
end

before '/users/*' do
  require_user
end ### Any way I could combine them together??

#Index
get "/users" do
  @users = User.all
  erb(:"users/index")
  ## Probably not necessary
end

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