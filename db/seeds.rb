require 'faker'

Article.delete_all
10.times do
  Article.create!(title: Faker::Lorem.words.join(' '), body: Faker::Lorem.paragraphs.join('\n'))
end
