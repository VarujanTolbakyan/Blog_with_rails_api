# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

article_body = "Lorem ipsum dolor sit amet, debet oportere sit an,\
  mei ut soluta eruditi. In per sapientem reprehendunt."

users = [{ name: 'Ashot', email: 'ashot@gmail.com', password: 'ashot<>111' },
         { name: 'Armen', email: 'armen@gmail.com', password: 'armen<>111' },
         { name: 'Sasha', email: 'Sasha@gmail.com', password: 'sasha<>111' }
]

comments = [[{body: 'ok', user_id: 1}, {body: 'good', user_id: 2}],
            [{body: 'ok', user_id: 1}, {body: 'good', user_id: 3}],
            [{body: 'ok', user_id: 2}, {body: 'good', user_id: 3}]
]

users = User.create users
puts 'users created' if users

User.all.each_with_index do |user, index|
  user.articles.create(
    title: "Good article#{index + 1}",
    body: article_body,
    category: 'news'
  )
  puts "#{user.name} articles created"
end

Article.all.each_with_index do |article, index|
  article.comments.create comments[index]
  puts "#{article.title} comments created"
end
