source 'http://rubygems.org'

gemspec

require File.expand_path('spec/support/detect_rails_version', File.dirname(__FILE__))

rails_version = detect_rails_version
gem 'rails', rails_version

group :test do
  gem 'rspec-rails',     '~> 2.9.0'
  gem 'sqlite3'
end
