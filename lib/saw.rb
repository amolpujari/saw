require "saw/version"
require "saw/util.rb"
require "saw/visit.rb"
require "saw/link.rb"

module Saw
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      require "saw/user_addition"
      require "saw/controller.rb"
      require "saw/visits_controller"
    end
  end
end
