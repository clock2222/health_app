require "csv"

CSV.foreach("db/category.csv") do |row|
  Category.create(id: row[0], name: row[1], ancestry: row[2])
end

email = "test@example.com"
password = "password"
nickname = "ゲストユーザー"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password", nickname: "テストユーザー１")
user2 = User.create!(email: "suzuki@example.com", password: "password", nickname: "テストユーザー２")
user3 = User.create!(email: "tanaka@example.com", password: "password", nickname: "テストユーザー３")

Status.create!(user_id: user1.id)
Status.create!(user_id: user2.id)
Status.create!(user_id: user3.id)

post1 = user2.posts.create!(title: "test1", content: "test1", category_id: 31, tag_name: "#頭痛")
post2 = user1.posts.create!(title: "test2", content: "test2", category_id: 31, tag_name: "#眼精疲労")
post3 = user3.posts.create!(title: "test3", content: "test3", category_id: 31, tag_name: "#肥満")
post4 = user3.posts.create!(title: "test4", content: "test4", category_id: 31, tag_name: "#コロナ")
post5 = user1.posts.create!(title: "test5", content: "test5", category_id: 31, tag_name: "#ストレス")

post1.likes.create!(user_id: user1.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user2.id)
post3.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user2.id)
post5.likes.create!(user_id: user3.id)

post1.graphs.create!(pain: 5, fatigue: 4, obesity: 3, anxiety: 2, insomnia: 1, other: 3)
post2.graphs.create!(pain: 1, fatigue: 2, obesity: 3, anxiety: 4, insomnia: 5, other: 2)
post3.graphs.create!(pain: 4, fatigue: 1, obesity: 3, anxiety: 1, insomnia: 2, other: 1)
post4.graphs.create!(pain: 2, fatigue: 3, obesity: 0, anxiety: 5, insomnia: 1, other: 4)
post5.graphs.create!(pain: 3, fatigue: 5, obesity: 1, anxiety: 2, insomnia: 3, other: 0)

User.create!(email: email, password: password, nickname: nickname)

puts "初期データの投入に成功しました！"
