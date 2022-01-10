AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

User.create!(nickname: "Test User",
             email: "test@example.com",
             password: "password")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = "password"
  User.create!(nickname: name,
               email: email,
               password: password)
end

User.all.each do |user|
  Status.create!(user_id: user.id)
  user.posts.create!(title: "テストタイトル#{user.id}", content: "レシピ情報には経緯、補足、詳細など書き込みます。")
end

Post.all.each do |post|
  post.ingredients.create!(ing_name: "テスト材料名その1",
                           quantity: "テスト分量その1",
                           explanation: "コツ・ポイントを書く場所です")
  post.ingredients.create!(ing_name: "テスト材料名その2",
                           quantity: "テスト分量その2",
                           explanation: "コツ・ポイントを書く場所です")
  post.ingredients.create!(ing_name: "テスト材料名その3",
                           quantity: "テスト分量その3",
                           explanation: "コツ・ポイントを書く場所です")
  post.hashtags.create!(hashname: "ハッシュタグ#{post.id}")
  post.graphs.create!(graph_a: rand(4),
                      graph_b: rand(4),
                      graph_c: rand(4),
                      graph_d: rand(4),
                      graph_e: rand(4),
                      graph_f: rand(4))
  User.all.each do |user|
    post.likes.create!(user_id: user.id)
  end
end
