require 'rails/generators/active_record'

class SawGenerator < ActiveRecord::Generators::Base
  desc "Create a migration to add saw-specific data. " +
       "Add tables visits and hits."

  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def generate_migration
    migration_template "saw_migration.rb.erb", "db/migrate/add_visits_and_hits}"
  end
end