source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg'
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'webpacker', '~> 4.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'listen', '~> 3.1.5'
gem 'email_validator'
gem 'jsonapi-serializer'

#mailers
gem 'mailgun-ruby', '~>1.1.6'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
