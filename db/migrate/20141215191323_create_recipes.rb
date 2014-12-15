class CreateRecipes < ActiveRecord::Migration
  def change
  	 create_table :recipes do |t|
      t.string :title, null: false
      t.string :time_to_cook, null: false
      t.string :main_ingredient, null: false
      t.text :ingredients
      t.integer :user_id
      t.text :recipe, default: ""
      t.boolean :is_favorite, default: false
      t.timestamps
    end
  end
end
