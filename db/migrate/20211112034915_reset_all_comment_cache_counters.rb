class ResetAllCommentCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Comment.find_each { |_coment| Comment.reset_counters(comment.id, :likes_count) }
  end

  def down; end
end
