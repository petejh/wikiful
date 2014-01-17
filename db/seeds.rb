# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create categories
categories = Category.create([
  { name: 'History'}, {name: 'Biology'}, {name: 'Literature'},
  { name: 'Mathematics'}, { name: 'Music Theory'}, { name: 'Computer Science'},
  { name: 'Sociology'}, {name: 'Chemistry'}
])

# Create users
users = User.create([
  { name: 'Thing One', email: 'thingone@catinthe.hat', password: 'seuss', password_confirmation: 'seuss' },
  { name: 'Thing Two', email: 'thingtwo@catinthe.hat', password: 'seuss', password_confirmation: 'seuss' },
  { name: 'Thing Tre', email: 'thingtre@catinthe.hat', password: 'seuss', password_confirmation: 'seuss' }
])

# Create articles
for i in 0..49
  title = Faker::Lorem.sentence(rand(2..10)).chomp('.')
  content = Faker::Lorem.paragraphs(6..20).join("\n\n")

  # randomly select one or more categories, starting with the first
  article_categories = Category.limit(1 + rand(Category.count))
  
  # randomly select a user
  user = User.first(offset: rand(User.count))
  
  a = Article.create(title: title, content: content, categories: article_categories, user: user)
end
