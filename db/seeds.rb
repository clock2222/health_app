require "csv"

CSV.foreach("db/category.csv") do |row|
  Category.create(id: row[0], name: row[1], ancestry: row[2])
end

email = "test@example.com"
password = "password"
nickname = "ゲストユーザー"

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password", nickname: "テストユーザー１")
user2 = User.create!(email: "suzuki@example.com", password: "password", nickname: "テストユーザー２")
user3 = User.create!(email: "tanaka@example.com", password: "password", nickname: "テストユーザー３")

Status.create!(user_id: user1.id)
Status.create!(user_id: user2.id)
Status.create!(user_id: user3.id)

post1 = user2.posts.create!(title: "test1", content: "test1", category_id: 31)
post2 = user1.posts.create!(title: "test2", content: "test2", category_id: 31)
post3 = user3.posts.create!(title: "test3", content: "test3", category_id: 31)
post4 = user3.posts.create!(title: "test4", content: "test4", category_id: 31)
post5 = user1.posts.create!(title: "test5", content: "test5", category_id: 31)

post1.likes.create!(user_id: user1.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user2.id)
post3.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user2.id)
post5.likes.create!(user_id: user3.id)

post1.hashtags.create!(hashname: "ストレス")
post2.hashtags.create!(hashname: "頭痛")
post3.hashtags.create!(hashname: "コロナ")
post4.hashtags.create!(hashname: "眼精疲労")
post5.hashtags.create!(hashname: "ダイエット")

post1.graphs.create!(graph_a: 0, graph_b: 1, graph_c: 2, graph_d: 3, graph_e: 4, graph_f: 1)
post2.graphs.create!(graph_a: 0, graph_b: 1, graph_c: 2, graph_d: 3, graph_e: 4, graph_f: 1)
post3.graphs.create!(graph_a: 0, graph_b: 1, graph_c: 2, graph_d: 3, graph_e: 4, graph_f: 1)
post4.graphs.create!(graph_a: 0, graph_b: 1, graph_c: 2, graph_d: 3, graph_e: 4, graph_f: 1)
post5.graphs.create!(graph_a: 0, graph_b: 1, graph_c: 2, graph_d: 3, graph_e: 4, graph_f: 1)

User.create!(email: email, password: password, nickname: nickname)
