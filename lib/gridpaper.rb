require 'rubygems'
require 'gridpaper/version'
require 'commander/import'
require 'fileutils'
require 'yaml'
require 'colorize'

module Gridpaper
  class Generate

    # Add Gridpaper to your project
    def initialize(path, stylesheets_dir="stylesheets", syntax=:sass)

      destination = File.join(path, stylesheets_dir)
      copy_files_to(destination, syntax)


    end

    private

    def copy_files_to(destination, syntax)
      template_dir = File.expand_path(File.join(File.dirname(__FILE__), '../', 'templates', syntax.to_s))
      template_dir_dest = File.join(destination, syntax.to_s)
      project_dir = Dir.pwd

      if File.exists?(template_dir_dest)
        output(template_dir_dest, :skipped)
      else
        FileUtils.mkdir_p(template_dir_dest)
        output(template_dir_dest, :created)
      end

      Dir.chdir(File.expand_path(template_dir))
      files = Dir['**/*']
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

end
