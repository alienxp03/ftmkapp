source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.0'
gem 'pg'
gem 'grape'
gem 'grape-entity'
gem 'rufus-scheduler'
gem 'nokogiri'
gem 'rack-cors'
gem 'grape-swagger'
gem 'grape-swagger-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'unicorn'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'database_cleaner'
  gem 'spork-rails'
  gem 'shoulda-matchers'
  gem 'dotenv-rails'

  # code analysis tools
  gem 'reek'
  gem 'rails_best_practices'
  gem 'rubocop', '0.28'

  # debugging
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
end
