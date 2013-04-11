require 'rubygems'
require 'bundler/setup'
require 'rails'
require 'rspec/rails'
require 'saw'

RSpec.configure do |config|
  # some (optional) config here
end

ENV['RAILS_ENV'] = 'test'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures = false
  config.render_views = false
end

Rails.logger.level = 4
