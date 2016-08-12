require_relative('../models/merchant')
require_relative('../models/transactions')

#Index
get '/merchants' do 
  @merchants = Merchant.all()
  erb(:'merchants/index')
end

#New
get '/merchants/new' do
  @transactions = Transaction.all()
  erb(:'merchants/new')
end

#Create
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect(to("/merchants"))
end

#Show
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:'merchants/show')
end

#Edit
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:'merchants/edit')
end

#Update
post '/merchants/:id' do
  @merchant = Merchant.update(params)
  redirect(to("/merchants/#{params[:id]}"))
end

#Delete
post '/merchants/:id/delete' do
  @merchant = Merchant.delete(params[:id])
  redirect(to("/merchants"))
end