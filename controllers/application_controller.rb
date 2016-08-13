require_relative('../models/auth')
require('pry-byebug')
#helper_method :current_user

configure do
  enable :sessions
  set :session_secret, "secret"
end

get '/' do
  erb :home
end

get '/registrations/signup' do
  erb(:"/registrations/signup")
end

post '/registrations' do
  # It will have the code that gets the new user's info from the params, creates a new user, signs them in and then redirects them somewhere else.
  # @auth = Auth.new(name: params["name"], email: params["email"], password: params["password"])
  @auth = Auth.new(params)
  @auth.save
  session[:id] = @auth.id
  redirect '/auth/home'
  #redirect(to("/registrations"))
end


get '/sessions/login' do
  #This route is responsible for rendering the login form.
  erb (:"/sessions/login")
end

post '/sessions' do
  #This route is responsible for receiving the POST request that gets sent when a user hits "submit" on that login form. This route has the code that grabs the user's info from the params, finds that user from the database and signs that user in.
  @auth = Auth.find_by(params[:email], params[:password])
  
  session[:id] = @auth.id
  redirect '/auth/home'
end

get '/sessions/logout' do
  #This route is responsible for logging the user out by clearing the session hash.
  
  session.clear # or set it to nil
  redirect '/'
end


get '/home' do
  erb :'/users/home' #This route is responsible for rendering the user's home page view.
end

get "/auth/home" do
  @auth = Auth.find(session[:id])
  erb :'auth/home'  
end