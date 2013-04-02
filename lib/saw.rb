require "saw/version"
require "saw/visit.rb"
require "saw/hit.rb"
require "saw/controller.rb"

module Saw
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      require "saw/visits_controller"
      require "saw/user_addition"
    end
  end
end
