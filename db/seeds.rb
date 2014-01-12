# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create 8 seed categories
categories = Category.create([
                { name: 'History'}, {name: 'Biology'}, {name: 'Literature'},
                { name: 'Mathematics'}, { name: 'Music Theory'}, { name: 'Computer Science'},
                { name: 'Sociology'}, {name: 'Chemistry'}
        ])

# create 50 articles, with random titles, 250 words of content, and
# randomly assign one or more of the categories above to each article
for i in 0..49
        title = Faker::Lorem.sentence(rand(2..10)).chomp('.')
        content = Faker::Lorem.paragraphs(6..20).join("\n\n")

        # randomly assign one or more of the categories we just created
        article_categories = Category.limit(1 + rand(Category.count))
        a = Article.create(title: title, content: content, categories: article_categories)
end
