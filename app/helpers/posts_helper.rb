module PostsHelper
  def render_with_hashtags(tag_name)
    tag_name.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/post/hashtag/#{word.delete('#')}" }.html_safe
  end
end
