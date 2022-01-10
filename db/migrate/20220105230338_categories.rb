class Categories < ActiveRecord::Migration[6.1]
  def change
    drop_table :categories, force: :cascade
  end
end
