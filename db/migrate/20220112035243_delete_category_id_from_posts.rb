class DeleteCategoryIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :category_id, :bigint
  end
end
