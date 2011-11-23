require 'rubygems'
require 'gridpaper/version'
require 'commander/import'
require 'fileutils'
require 'yaml'

module Gridpaper
  class Generate

    # Add Gridpaper to your project
    def initialize(path)
      templates_path = File.join(File.dirname(__FILE__), '../', 'templates', 'sass', 'gridpaper')
      destination_path = File.join(path, 'stylesheets', 'sass', 'gridpaper')

      template_files = [
        '_all.sass',
        '_forms.sass',
        '_grid.sass',
        '_reset.sass'
      ]


      # Create the main stylesheets directory
      if exists?(destination_path)
        puts "skipped: #{ destination_path } (exists)"
      else
        FileUtils.mkdir_p(destination_path)
        puts "created: #{ destination_path }"
      end

      # Copy templates to destination directory
      template_files.each do |file|
        source_file = File.join(templates_path, file)
        new_file = File.join(destination_path, file)
        if exists?(new_file)
          puts "skipped: #{ new_file } (exists)"
        else
          FileUtils.cp_r(new_file, destination_path)
          puts "created: #{ new_file }"
        end
      end

    end

  end

end
