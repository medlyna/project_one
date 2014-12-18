class Recipe < ActiveRecord::Base
  #validations
  validates_presence_of :title

  #relationships
  belongs_to :user
end