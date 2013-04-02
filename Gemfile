source 'http://rubygems.org'

gemspec

require File.expand_path('spec/support/detect_rails_version', File.dirname(__FILE__))

rails_version = detect_rails_version
gem 'rails', rails_version

case rails_version
when /^3\.0/
  # Do nothing, bundler should figure it out
else
  raise "Rails #{rails_version} is not supported yet"
end

group :development, :test do
  gem 'parallel_tests'
  gem 'cane'
  gem 'brakeman', :require => false
end

group :test do
  gem 'rspec-rails',    '~> 2.9.0'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
end
