require_relative('../models/tag')
require_relative('../models/transactions')


#Index
get '/tags' do
  @tags = Tag.all()
  erb(:'tags/index')
end

#New
get '/tags/new' do
  @transactions = Transaction.all()
  erb(:'tags/new')
end

#Create
post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect(to("/tags"))
end

#Show
get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb(:'tags/show')
end

#Edit
get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:'tags/edit')
end

#Update
post '/tags/:id' do
  @tag = Tag.update(params)
  redirect(to("/tags/#{params[:id]}"))
end

#Delete
post '/tags/:id/delete' do
  @tag = Tag.delete(params[:id])
  redirect(to("/tags"))
end