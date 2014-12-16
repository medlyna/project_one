class CreateUsers < ActiveRecord::Migration
	def change
	  create_table :users do |t|
	    #basic attributes
	    t.string :email
	    t.string :hashed_password
	    t.string :salt
	    t.timestamps
	  end

	  add_index :users, :email, :unique => true
	end
end