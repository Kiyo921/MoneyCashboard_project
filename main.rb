require('sinatra')
require('sinatra/contrib/all')
require_relative('controller/transaction_controller')
require_relative('controller/user_controller')

get '/' do
  erb :home

end