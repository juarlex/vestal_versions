require 'rails/generators/migration'
module VestalVersions
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Generates a migration file to create vestal_versions table and install the rails initializer."

      def self.source_root
        @_source_root = File.expand_path('../templates', __FILE__)
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def copy_migration_template
        migration_template "migration.rb", "db/migrate/create_vestal_versions"
      end

      def copy_initializer
        template "initializer.rb", "config/initializers/vestal_versions.rb"
      end
    end
  end
end