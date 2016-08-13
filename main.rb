require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/transactions_controller')
require_relative('controllers/users_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/application_controller')

#enable :sessions 

get '/' do
  erb :home
end