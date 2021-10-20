class CreateHashtagMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtag_maps do |t|
      t.references :post, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
