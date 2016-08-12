require_relative('../models/user')

#Index
# get "/users" do
#   ## Probably not necessary
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

#Show
get '/users/:id' do
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
  redirect(to("/users/#{params[:id]}"))
end

#Delete
post '/users/:id/delete' do
  @user = User.delete(params[:id])
  redirect(to("/users"))
end