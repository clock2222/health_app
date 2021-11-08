class AddExplanationToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :explanation, :string
  end
end
