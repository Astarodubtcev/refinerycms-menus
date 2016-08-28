source "http://rubygems.org"

gemspec

gem 'refinerycms', '~> 3.0'
gem 'refinerycms-i18n'
gem 'rails', '>= 4.2.7'

# Database Configuration
platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
end

platforms :ruby do
  gem 'sqlite3'
  gem 'mysql2'
  gem 'pg'
end

group :development do
  gem 'rails-footnotes'
  gem 'meta_request'
end

group :development, :test do
  unless ENV['TRAVIS']
    gem 'simplecov', :require => false
    gem 'guard-rspec'
    gem 'poltergeist'
  end

  gem 'capybara-webkit'
  gem 'launchy'
  gem 'refinerycms-testing'
  gem 'rspec-rails'

  platforms :mswin, :mingw do
    gem 'win32console'
    gem 'rb-fchange'
    gem 'rb-notifu'
  end

  platforms :ruby do
    gem 'spork'
    gem 'guard-spork'

    unless ENV['TRAVIS']
      require 'rbconfig'
      if RbConfig::CONFIG['target_os'] =~ /darwin/i
        gem 'rb-fsevent'
        gem 'ruby_gntp'
      end
      if RbConfig::CONFIG['target_os'] =~ /linux/i
        gem 'rb-inotify'
        gem 'libnotify'
        gem 'therubyracer'
      end
    end
  end

  platforms :jruby do
    unless ENV['TRAVIS']
      require 'rbconfig'
      if RbConfig::CONFIG['target_os'] =~ /darwin/i
        gem 'ruby_gntp'
      end
      if RbConfig::CONFIG['target_os'] =~ /linux/i
        gem 'rb-inotify'
        gem 'libnotify'
      end
    end
  end
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
