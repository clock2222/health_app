class CreateLikeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :like_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :like_comments, [:user_id, :comment_id], unique: true
  end
end
