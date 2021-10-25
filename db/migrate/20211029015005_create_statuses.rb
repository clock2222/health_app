class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.integer :sex, default: 0
      t.integer :age, default: 0
      t.integer :height, default: 0
      t.integer :weight, default: 0
      t.integer :body_type, default: 0
      t.integer :meal, default: 0
      t.integer :movement, default: 0
      t.integer :sleep, default: 0
      t.integer :environment, default: 0
      t.integer :annual_income, default: 0
      t.integer :happiness, default: 0
      t.integer :human_relationship, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
