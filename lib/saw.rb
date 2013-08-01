require "saw/version"
require "saw/util.rb"
require "saw/track_visit.rb"
require "saw/track_link.rb"

module Saw
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      require "saw/user_addition"
      require "saw/controller.rb"
      require "saw/track_visits_controller"
    end
  end
end
