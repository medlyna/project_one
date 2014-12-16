class User < ActiveRecord::Base
	Sinatra::SimpleAuthentication.require_adapter
	include Sinatra::SimpleAuthentication::Models::ActiveRecord::Adapter

	has_many :recipes
end
