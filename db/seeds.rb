require "csv"

CSV.foreach("db/category.csv") do |row|
  Category.create(id: row[0], name: row[1], ancestry: row[2])
end

email = "test@example.com"
password = "password"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

post1 = user2.posts.create!(title: "test1", content: "レシピ１", category_id: 31)
post2 = user1.posts.create!(title: "test2", content: "レシピ２", category_id: 31)
post3 = user3.posts.create!(title: "test3", content: "レシピ３", category_id: 31)
post4 = user3.posts.create!(title: "test4", content: "レシピ４", category_id: 31)
post5 = user1.posts.create!(title: "test5", content: "レシピ５", category_id: 31)

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

User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"
