source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc1', '< 5.1'
# User Rails 12factor to deploy to Heroku
gem 'rails_12factor', group: :production
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use ActiveModelSerializers to serialize models into JSON
gem 'active_model_serializers', '~> 0.9.3'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use Devise Token Auth for user authentication
gem 'omniauth', '~> 1.3'
gem 'devise_token_auth', '~> 0.1.41'
# Use Acts As Taggable for tags
gem 'acts-as-taggable-on', github: 'cireficc/acts-as-taggable-on'

# Use Yard-restful for API documentation; include its dependencies (Yard and Redcarpet [Markdown gem])
gem 'yard'
gem 'redcarpet'
gem 'yard-restful', '~> 1.2.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use Rspec,FactoryGirl and DatabaseCleaner for testing
  gem 'rspec-rails', '~> 3.5.0.beta4'
  gem 'factory_girl', '~> 4.7'
  gem 'database_cleaner', '~> 1.5.3'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~> 5.0'
  gem 'rack-mini-profiler', '~> 0.9.9.2'
end

group :test do
  gem 'simplecov', require: false
  gem 'coveralls', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.3.1"