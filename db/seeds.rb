require 'faker'
require_relative 'articles'

Article.delete_all

article = Article.create({
  title: "Using AngularJS with Chef",
  body: articles[0]
})

article.add_tags(['Chef', 'AngularJS', 'Rails'])

# 10.times do
#   Article.create!(title: Faker::Lorem.words.join(' '), body: Faker::Lorem.paragraphs.join('\n'))
# end
