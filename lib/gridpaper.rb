require 'rubygems'
require 'gridpaper/version'
require 'commander/import'
require 'fileutils'
require 'yaml'
require 'colorize'
require 'guard'
# require 'guard-sass'

module Gridpaper
  class Generate

    # Add Gridpaper to your project
    def initialize(path, stylesheets_dir="stylesheets", syntax=:sass)

      destination = File.join(path, stylesheets_dir)
      puts stylesheets_dir.cyan
      copy_files_to(destination, syntax.to_s)


    end

    private

    def copy_files_to(destination, syntax)
      template_dir = File.expand_path(File.join(File.dirname(__FILE__), '../', 'templates', syntax.to_s))
      template_dir_dest = File.join(destination, syntax)
      project_dir = Dir.pwd

      if File.exists?(template_dir_dest)
        output(template_dir_dest, :skipped)
      else
        FileUtils.mkdir_p(template_dir_dest)
        output(template_dir_dest, :created)
      end

      # Get a listing of all files and folders in the
      # templates directory for the specified syntax
      Dir.chdir(File.expand_path(template_dir))
      files = Dir['**/*']
      puts files
      Dir.chdir(project_dir)

      files.each do |file|
        src = File.join(template_dir, file)
        dest = File.join(template_dir_dest, file)

        if File.exists?(dest)
          output(dest.to_s, :skipped)
        else
          FileUtils.mkdir_p(dest) if File.directory?(src)
          FileUtils.cp(src, dest) unless File.directory?(src)
          output(dest.to_s, :created)
        end

      end
    end

    def output(message, status)
      puts "#{ status.to_s }: #{ message }".to_s.green if status == :created
      puts "#{ status.to_s }: #{ message } (exists)".to_s.yellow if status == :skipped
      puts "#{ status.to_s }: #{ message }".to_s.red if status == :failed
    end
  end

  class Watch


    def initialize(input, output)
      # working_dir = Dir.pwd
      @@output_path = output
      @@input_path = input

      guardfile = File.expand_path(File.join(File.dirname(__FILE__), 'Guardfile'))
      # puts guardfile.cyan

      # Guard.setup
      # Guard::Dsl.evaluate_guardfile(:guardfile => guardfile)
      # Guard::Dsl.local_guardfile_path(guardfile)
      # puts Guard::Dsl.guardfile_path.cyan

      Guard.start(:guardfile => guardfile, :watchdir => input)
    end

    def self.output_path
      return @@output_path
    end

    def self.input_path
      return @@input_path
    end

  end

end
