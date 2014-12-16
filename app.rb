require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


require 'sinatra/simple-authentication'
require './models/user'
#require 'rack-flash'

require_relative './models/user'
# require_relative './models/post'
# require_relative './models/recipes'
require_relative './config/environments'


#############################################
# USER AUTHENTICATION 

register Sinatra::SimpleAuthentication

#use Rack::Flash, :sweep => true

Sinatra::SimpleAuthentication.configure do |c|
	c.use_password_confirmation = true
	c.min_password_length = 6
	c.max_password_length = 20
	c.taken_email_message = "Custom taken email"
	c.missing_email_message = "Custom missing email"
	c.invalid_email_message = "Custom invalid email"
	c.missing_password_message = "Custom missing password"
	c.short_password_message = "Custom short password"
	c.long_password_message = "Custom long password"
	c.missing_password_confirmation_message = "Custom missing password confirmation"
	c.password_confirmation_dont_match_password_message = "Custom doesn't match password and confirmation"
	c.login_wrong_email_message = "Custom wrong email"
	c.login_wrong_password_message = "Custom wrong password"
	c.login_successful_message = "Custom Login successful"
end

#############################################


# INDEX ROUTE: LOGIN/SIGN-UP
get '/' do
	login_required
	erb :main_page
end

# get '/lists' do
# 	@ingredient = params[:ingredient]
# 	@time = params[:time]

# # if @ingredient && @time
# # 	redirect 'lists/:ingredient/:time'

# 	erb :lists
# end

# get '/lists' do
# 	erb :lists
# end

post '/recipesuggestions' do
	@main_ingredient = params[:main_ingredient]
end



# get '/login' do
# 	erb :login
# end

# post '/login' do
# 	user = User.find_by(email: params[:email])
# 	if user && user.authenticate(params[:password])
# 		session[:user_id] = user.id
# 		redirect('/mainpage')
# 	else
# 		@errors << "Invalid email or password."
# 		erb :login
# 	end
# end

# #MAIN PAGE
# get '/mainpage' do
# 	erb :main_page
# end

# get "/users" do
#   if current_user?
#     erb :main_page
#   else
#     redirect('/session/login')
# end





















