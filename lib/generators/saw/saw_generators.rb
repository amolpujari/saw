require 'rails/generators/active_record'

module Saw
  module Generators
    class Migration < ActiveRecord::Generators::Base
      desc "Create a migration to add saw-specific data. " +
           "Add tables visits and hits."

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def generate_migration
        migration_template "saw_migration.rb.erb", "db/migrate/add_visits_and_hits}"
      end
    end

    class Routes < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      desc "Adds a route for recording visits by POST ajax" +
           "Adds POST /visits => visits#create"

      def add_saw_routes
        route 'post "visits" => "visits#create", :defaults => { :format => "json"}'
      end
    end
  end
end