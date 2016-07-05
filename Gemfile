source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'holiday_jp'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'haml-rails'
gem 'react-rails', '~> 1.1.0'
gem 'pry-rails'
gem 'pry-byebug'

source 'https://rails-assets.org' do
  gem 'rails-assets-react-bootstrap'
end

#NOTE some cuke features fail with 3.3.4.1
gem 'bootstrap-sass', '3.3.3'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
