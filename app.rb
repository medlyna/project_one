require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


require 'sinatra/simple-authentication'
require './models/user'
#require 'rack-flash'

require_relative './models/user'
require_relative './config/environments'

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



get '/' do
	login_required
	erb :index
end

# post ''