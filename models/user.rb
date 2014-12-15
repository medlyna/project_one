class Users < ActiveRecord::Base
	Sinatra::SimpleAuthentication.require_adapter
	include Sinatra::SimpleAuthentication::Models::ActiveRecord::Adapter
end