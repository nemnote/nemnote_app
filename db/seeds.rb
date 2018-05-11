User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

#カテゴリーデータ
categories = ["エンタメ","スポーツ","コラム","ビジネス","ライフスタイル","テクノロジー"]
categories.each {|category|
  Category.create!(name:category)
}

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  title = Faker::Book.title
  users.each { |user| user.notes.create!(content: content,title: title,category:rand(1..6))}
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }