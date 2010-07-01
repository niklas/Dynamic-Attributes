source 'http://rubygems.org'

gem 'rails', '3.0.0.beta4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
# group :test do
#   gem 'webrat'
# end

gem "haml"
group :development do
  gem "rails3-generators", :group => 'development'
end

group :test do
  gem "rspec-rails",        "2.0.0.beta.10"
  gem "rspec",              "2.0.0.beta.10"
  gem "rspec-core",         "2.0.0.beta.10"
  gem "rspec-expectations", "2.0.0.beta.10"
  gem "rspec-mocks",        "2.0.0.beta.10"

  gem 'redgreen'

  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber', '0.8.0'
  gem 'spork'
  gem 'launchy'

  gem 'factory_girl', :git => 'git://github.com/thoughtbot/factory_girl.git', :branch => 'rails3'

  gem 'pickle', :git => 'git://github.com/codegram/pickle.git'
end
