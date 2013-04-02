require "saw/version"
require "saw/visit.rb"
require "saw/hit.rb"
require "saw/controller.rb"

module Saw
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      class VisitsController < ApplicationController
        def create
          saw params[:doing]
          head :ok
        end
      end
    end
  end
end




