source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.0'

gem 'rails', '~> 5.2.3'
gem 'google-cloud-storage'
gem 'knock'
gem 'puma'
gem 'jbuilder'
gem 'sendgrid-actionmailer'
gem 'steam_web_api'
gem 'rails_12factor'
gem 'rack-cors'
gem 'pg'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  gem 'rails-erd', require: false
end
