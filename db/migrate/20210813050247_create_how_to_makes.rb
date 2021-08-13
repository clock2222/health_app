class CreateHowToMakes < ActiveRecord::Migration[6.1]
  def change
    create_table :how_to_makes do |t|
      t.references :post, null: false, foreign_key: true
      t.text :explanation

      t.timestamps
    end
  end
end
