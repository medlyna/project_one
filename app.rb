require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'

require 'sinatra/simple-authentication'

#require 'rack-flash'

require_relative './models/user'
# require_relative './models/post'
require_relative './models/recipe'
require_relative './config/environments'
# binding.pry

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

get '/main_page' do
	erb :main_page
end


get '/recipesuggestions' do
	params.inspect
	@recipes = Recipe.where(:main_ingredient => params[:main_ingredient], :time_to_cook => params[:time_to_cook])
	@recipes ||= []

	erb :recipesuggestions
	
 end

 get '/:id/recipe' do
 	@recipe = Recipe.find(params[:id])
 	erb :single_ingredient_page
 end


get '/make_a_post' do
	erb :make_a_post
end

post '/make_a_post' do
	@recipe_title = params[:title]
	@recipe_main_ingredient = params[:main_ingredient]
	@recipe_time = params[:time_to_cook]
	@recipe_ingredients = params[:ingredients]
	@recipe_description= params[:recipe]
	
	Recipe.create(title: @recipe_title, time_to_cook: @recipe_time, main_ingredient: @recipe_main_ingredient, ingredients: @recipe_ingredients, recipe: @recipe_description)
	erb :main_page
end

#UPDATING RECIPES
post '/make_an_edit/:recipeid' do 

	@update_recipe_title = params[:title]
	@update_recipe_main_ingredient = params[:main_ingredient]
	@update_recipe_time = params[:time_to_cook]
	@update_recipe_ingredients = params[:ingredients]
	@update_recipe_description= params[:recipe]

	recipe = Recipe.find(params[:recipeid])

	recipe.update(title: @update_recipe_title, time_to_cook: @update_recipe_time, main_ingredient: @update_recipe_main_ingredient, ingredients: @update_recipe_ingredients, recipe: @update_recipe_description)

	redirect '/main_page'

end

get '/make_an_edit/:recipeid' do
  @update_recipe = Recipe.find(params[:recipeid])
  erb :recipe_edit
end

##DELETING RECIPES##
get "/delete/:recipeid" do
	@recipe_to_delete = Recipe.find(params[:recipeid])
	
	@recipe_to_delete.delete
	redirect('/main_page')

end

get '/about' do
	erb :about
end





