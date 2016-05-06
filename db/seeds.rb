# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Post.delete_all
Comment.delete_all

users = []
10.times do
	users << User.create({username: Faker::Internet.user_name, password: "12345"});
end
posts = []
30.times do 
	posts << Post.create({user_id: users.sample.id, title: Faker::Lorem.word, body: Faker::Lorem.paragraph});
end

30.times do
	Comment.create({user_id: users.sample.id, post_id: posts.sample.id, body: Faker::Lorem.sentence});
end