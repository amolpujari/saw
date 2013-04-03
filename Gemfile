source 'http://rubygems.org'

gemspec

require File.expand_path('test/support/detect_rails_version', File.dirname(__FILE__))

rails_version = detect_rails_version
gem 'rails', rails_version

case rails_version
when /^3\.0/
  # Do nothing, bundler should figure it out
else
  raise "Rails #{rails_version} is not supported yet"
end

group :test do
  gem 'rspec-rails',    '~> 2.9.0'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
