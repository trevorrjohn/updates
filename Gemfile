source 'https://rubygems.org'

gem 'rails',           github: 'rails/rails'
gem 'arel',            github: 'rails/arel'
gem 'sprockets-rails', github: 'rails/sprockets-rails'
gem 'sass-rails',      github: 'rails/sass-rails'
gem 'coffee-rails',    github: 'rails/coffee-rails'

gem 'haml-rails', github: 'indirect/haml-rails'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'pg'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn', group: [ :production ]

gem 'sdoc', require: false, group: [ :doc ]

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 2.0'
end

group :test do
  gem 'capybara-webkit'
end
