source 'http://rubygems.org'

gem 'rails', '3.2.13'
gem 'sqlite3', :group => [:development, :test]

group :production do
  gem 'thin'
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'faker'
  gem 'debugger'
  gem 'better_errors'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'thin'
end

gem 'compass'
gem 'rails_autolink'
gem 'private_pub'
gem 'zeroclipboard-rails'
gem 'os'