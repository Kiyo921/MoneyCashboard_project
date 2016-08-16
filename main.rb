require('sinatra')
require('pony')
require('sinatra/contrib/all')
require_relative('controllers/users_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/application_controller')
require_relative('controllers/contact_controller')


get '/' do
  erb :home
end