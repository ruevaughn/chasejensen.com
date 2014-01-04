# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_post do
    title "MyString"
    body "MyText"
    published_at "2014-01-04 15:53:01"
  end
end
