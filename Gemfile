# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'kaminari'
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler', '~> 1.4'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano3-puma'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Add by us
gem 'active_model_serializers', '0.10.10' # Format json helper
gem 'carrierwave', '~> 2.0' # Image uploader
gem 'daemons', '1.3.1' # background tasks
gem 'delayed_job_active_record', '4.1.4' # Background tasks
gem 'devise', '4.7.1' # User authentication
gem 'dotenv-rails', '2.7.4' # Dotenv hiding secrets key
gem 'enumerize', '2.3.1' # Enumerated attributes
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'mini_magick', '4.9.5' # Image file uploader
gem 'ransack', '2.3.2' # Filter records
gem 'simple_command', '0.1.0' # Service objects
gem 'veritrans', '2.3.0' # Payment gateway
