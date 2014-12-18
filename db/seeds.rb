# create_table :recipes do |t|
#       t.string :title, null: false
#       t.string :time_to_cook, null: false
#       t.string :main_ingredient, null: false
#       t.text :ingredients
#       t.integer :user_id
#       t.text :recipe, default: ""
#       t.boolean :is_favorite, default: false
#       t.timestamps
require_relative "../app.rb"

Recipe.delete_all

recipes = Recipe.create([
	{ :title => "Caesar Salad With Grilled Garlic and Chicken", :time_to_cook => "20 minutes", :main_ingredient => "Chicken", :ingredients => "<ol><p>2 boneless, skinless chicken breasts, each 3 ounces<br>3 tablespoons fat-free Italian dressing</p><p>For the dressing:<br>1 1/2 tablespoons fat-free mayonnaise<br>1/4 teaspoon extra-virgin olive oil<br>1/2 teaspoon red wine vinegar<br>1/4 teaspoon Worcestershire sauce<br>1 teaspoon fresh lemon juice<br>1/2 clove garlic, minced<br>1 1/2 teaspoons water<br>Freshly ground black pepper, to taste</p><p>4 cups romaine lettuce<br>1/2 ounce (about 3 tablespoons) Parmigiano-Reggiano cheese, freshly grated<br>1/2 cup whole-wheat croutons</p></ol>", :recipe => "<ol><li>Heat grill to medium-high. Place 1 teaspoon oil and all but 2 cloves of the garlic on a piece of heavy-duty foil and close to form a pouch.</li><li>Grill the pouch, shaking occasionally, until the garlic is soft, 12 minutes.</li><li>Meanwhile, rub the chicken with 1 teaspoon oil and season with ¼ teaspoon each salt and pepper. Grill until cooked through, 5 to 6 minutes per side.</li><li>Grill the bread for 1 minute per side.</li><li>Peel and finely chop the 2 raw garlic cloves. Add to a large bowl with the anchovies, lemon juice, mustard, Worcestershire sauce, and remaining oil. Toss with the lettuce.</li><li>Serve the lettuce with the chicken and Parmesan. Squeeze the grilled garlic cloves from their skins and serve with the toasts.</li></ol>"}
	])



