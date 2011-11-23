require 'rubygems'
require 'gridpaper/version'
require 'commander/import'
require 'fileutils'
require 'yaml'

module Gridpaper
  class Generate

    # Add Gridpaper to your project
    def initialize(path)
      # Create the main stylesheets directory
      destination_path = File.join(path, "stylesheets")
      FileUtils::Verbose.mkdir(destination_path)

      # Copy templates to destination directory
      templates_path = File.join(File.dirname(__FILE__), '../', 'templates', 'sass')
      FileUtils::Verbose.cp_r(templates_path, destination_path)
    end

  end

end
