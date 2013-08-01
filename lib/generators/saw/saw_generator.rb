require 'rails/generators/active_record'

class SawGenerator < ActiveRecord::Generators::Base
  include Rails::Generators::ResourceHelpers

  desc "Create a migration to add saw-specific data. " +
       "Add tables track_visits and track_links." +
       "Adds a route for recording track_visits by POST ajax" +
       "Adds POST /track_visits => track_visits#create"

  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def generate_migration
    migration_template "saw_migration.rb.erb", "db/migrate/add_track_visits_and_track_links"
  end

  def generate_routes
    route 'post "track_visits" => "track_visits#create", :defaults => { :format => "json"}'
  end
end
