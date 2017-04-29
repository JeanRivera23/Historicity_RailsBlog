# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {fname: "Luke", lname: "Skywalker", password: "12345"},
  {fname: "Cookie", lname: "Monster", password: "12345"},
  {fname: "Spongebob", lname: "Squarepants", password: "12345"}
  ])

posts = Post.create([
  {title: "Hello", content: "May the force be with you.", user_id: 1},
  {title: "Cookies", content: "I love cookies.", user_id: 2},
  {title: "My Job", content: "I make patties for a living.", user_id: 3}
  ])

comments = Comment.create([
  {content: "What does that even mean. Why not offer cookies?", post_id: 1, user_id: 2},
  {content: "You should broaden your horizons. My patties are better than cookies", post_id: 2, user_id: 3},
  {content: "You would feel more fulfilled as a jedi.", post_id: 3, user_id: 1}
  ])
