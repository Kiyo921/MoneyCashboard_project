require_relative('../models/transaction')

#Index
get '/transactions' do
  @transactions = Transaction.all() 
  erb(:'transactions/index')
end

#New
get '/transactions/new' do
  erb(:'transactions/new')
end

#Create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect(to("/transactions"))
end

#Show
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:'transactions/show')
end

#Edit
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:'transactions/edit')
end

#Update
post '/transactions/:id' do
  @transaction = Transaction.update(params)
  redirect(to("/transactions/#{parms[:id]}"))
end

#Delete
post '/transactions/:id/delete' do
  @transaction = Transaction.delete(param[:id])
  redirect(to("/transactions"))
end