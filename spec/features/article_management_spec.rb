require 'spec_helper'
require 'faker'

feature "Article Management" do
  before(:each) do
    username = 'chase'
    password = 'chaskins182'
      if page.driver.respond_to?(:basic_auth)
          puts 'Responds to basic_auth'
          page.driver.basic_auth(username, password)
      elsif page.driver.respond_to?(:basic_authorize)
          puts 'Responds to basic_authorize'
          page.driver.basic_authorize(username, password)
      elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
          puts 'Responds to browser_basic_authorize'
          page.driver.browser.basic_authorize(username, password)
      else
          raise "I don't know how to log in!"
      end
  end
  scenario "creates a new article" do
    visit new_article_path
    page.should have_content(/Post New Article/)
    page.should have_field('title')
    page.should have_field('body')
    page.should have_field('article-date')
    fill_in 'title', with: Faker::Lorem.words(3).join(' ')
    fill_in 'body', with: Faker::Lorem.paragraph(3)

    within('#new-tag') do
      page.should have_field('tag')
      fill_in 'tag', with: Faker::Lorem.word
    end

  end
end

feature "Can't access" do
  scenario "creates a new article" do
    visit new_article_path
    page.should have_content(/denied/)
  end
end
