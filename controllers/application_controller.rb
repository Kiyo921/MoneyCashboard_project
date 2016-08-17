require_relative('../models/user')
require('pry-byebug')
#helper_method :current_user

configure do #Code inside this block is run only once at startup.
  enable :sessions #Session cookies only last for the term of a session, and are deleted when the user closes the browser.
  set :session_secret, "secret" #Sessions are also signed while in production mode with a randomly gen- erated token to ensure that no one has been tampering with the cookie. This token can be set manually using the following setting:
end
#HTTP is a stateless protocol, which means that each request is independent of others. In other words, each request knows nothing about the previous or next re- quest. One way to overcome this and keep track of one request to the next is to use sessions


def current_user 
  @current_user ||= User.find(session[:id]) if session[:id] 
end #This method determines whether a user is logged in or logged out. It does this by checking whether there's a user in the database with a given session id.

def require_user 
  redirect(to('/'))  unless current_user 
end


get '/' do
  @user = User.find(session[:id])  unless session[:id] == nil
  erb :home
end

get '/registrations/signup' do
  erb(:"/registrations/signup")
end

post '/registrations' do
  # It will have the code that gets the new user's info from the params, creates a new user, signs them in and then redirects them somewhere else.
  # @user = User.new(name: params["name"], email: params["email"], password: params["password"])
  @user = User.new(params)
  @user.save
  session[:id] = @user.id
  redirect(to("/"))
end

get '/sessions/login' do
  #This route is responsible for rendering the login form.
  erb (:"/sessions/login")
end

post '/sessions' do
  #This route is responsible for receiving the POST request that gets sent when a user hits "submit" on that login form. This route has the code that grabs the user's info from the params, finds that user from the database and signs that user in.
  @user = User.find_by(params[:email], params[:password])
  
  session[:id] = @user.id
  redirect '/'
end

get '/sessions/logout' do
  #This route is responsible for logging the user out by clearing the session hash.
  
  session.clear # or set it to nil
  redirect '/'
end


get '/home' do
  erb :'/users/home' #This route is responsible for rendering the user's home page view.
end

get "/users/home" do  
  @user = User.find(session[:id])
  erb :'users/home'  
end