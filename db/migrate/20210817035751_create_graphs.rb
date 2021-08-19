class CreateGraphs < ActiveRecord::Migration[6.1]
  def change
    create_table :graphs do |t|
      t.integer :pain
      t.integer :fatigue
      t.integer :obesity
      t.integer :anxiety
      t.integer :insomnia
      t.integer :other
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
