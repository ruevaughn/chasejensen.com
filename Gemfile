source 'https://rubygems.org'

group :default do
  # gem 'acts-as-taggable-on', '~> 3.0.0'
  gem 'bcrypt-ruby', '~> 3.1.2'
  gem 'capistrano', '~> 3.1.0'
  gem 'friendly_id', github: 'norman/friendly_id', branch: 'master'
  gem 'pg', '~> 0.17.1'
  gem 'rails', '4.1.0.beta1'
  gem 'spring', '~> 1.0.0'
  gem 'minitest' # temporarilly shut minitest the fuck up about requires

  
  # Assets
  gem 'bootstrap-sass', '~> 3.0.3.0'
  gem 'coderay', '~> 1.1.0' 
  gem 'coffee-rails', '~> 4.0.0'
  gem 'jquery-rails', '~> 3.0.4'
  # gem 'jasmine', '2.0.0' # I monkey patch by replacing line 6 in lib/jasmine/railtie.rb with initializer "jasmine.initializer", :before => :load_environment_hook do so generator would work
  gem 'redcarpet', '~> 3.0.0'
  gem 'sass-rails', '~> 4.0.0.rc1'
  gem 'simple_form', '~> 3.0.1'
  gem 'turbolinks', '~> 2.1.0'
  gem 'uglifier', '>= 1.3.0'
end
  
group :test do
  gem 'capybara', '~> 2.2.0'
  gem 'launchy'
  gem 'shoulda-matchers', '~> 2.4.0'
  gem 'faker', '~> 1.2.0'
end

group :development do
  # http://effectif.com/vim/using-ctags-with-bundler-gems
  # gem 'guard-ctags-bundler'
  # gem 'rb-readline'
end

group :test, :development do
  gem 'selenium-webdriver'
  gem 'pry-rails', '~> 0.3.2'
  gem 'pry-debugger'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'rspec', '~> 2.14.1'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'guard-rspec'
  gem 'guard-jasmine'
  gem 'jasmine-rails'
end

