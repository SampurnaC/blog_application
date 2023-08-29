# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.create!(
	email: "test@test.com",
	password: "test@test.com",
	password_confirmation: "test@test.com"
)

p "Created #{User.count} users"

7.times do |index|
	Category.create!(
		name: Faker::Device.unique.manufacturer
	)
end
p "Created #{Category.count} categories"

10.times do |index|
	Post.create!(
		title: Faker::Quote.famous_last_words,
		content: Faker::Quote.matz,
		user: User.last,
		category: Category.last
	)
end
p "Created #{Post.count} posts"

9.times do |index|
	Comment.create!(
		comment: Faker::Restaurant.description,
		post_id: Post.all.map(&:id).sample,
		user: User.last
	)
end
p "Created #{Comment.count} comments"
