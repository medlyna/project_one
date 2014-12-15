require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/simple-authentication'
require 'rack-flash'

require_relative './models/user'
require_relative './config/environments'


# Setting configuration options on our authentication gem
Sinatra::SimpleAuthentication.configure do |c|
  c.use_password_confirmation = true
end
# Telling the app to use Rack::Flash
use Rack::Flash, :sweep => true
# Telling the app to use SimpleAuthentication
register Sinatra::SimpleAuthentication

# Our first route
get '/' do
  # Require a login to enter this route, otherwise go to the login page
  login_required
  erb :index
end