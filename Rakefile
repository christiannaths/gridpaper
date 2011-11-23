require 'bundler/gem_tasks'
require 'fileutils'
require 'colorize'

desc "Build SCSS templates"
task 'convert' do
  FileUtils.mkdir("scss") unless File.exists?("templates/scss")
  `sass-convert -R templates/sass templates/scss --from sass --to scss --unix-newlines`
  puts "templates converted to SCSS in 'templates/scss'".green
end
