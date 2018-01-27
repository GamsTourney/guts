source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'jbuilder', '~> 2.5'
gem 'steam_web_api'

gem 'sqlite3', group: :development # Added development group.
gem 'pg', group: :production # Added postgres and made it production only.
gem 'rails_12factor'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'rails-erd', require: false, group: :development
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
