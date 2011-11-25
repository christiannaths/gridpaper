require 'guard/guard'
require 'colorize'

module ::Guard
  class RakeInstall < Guard
    def start
      ::Guard::Notifier::notify('ready', :title => 'Gridpaper')
    end

    def stop
      ::Guard::Notifier::notify('stopped watching for changes', :title => 'Gridpaper')
    end

    def reload
      stop
      start
    end

    def run_all
      true
    end

    def run_on_change(paths)
      system('rake install')
      ::Guard::Notifier::notify('built and installed', :title => 'Gridpaper')
    end

  end
end

# Available options: :pidfile, :port, :executable
guard 'rake-install' do
  watch(%r{^.+\.gemspec})
  watch(%r{^(lib\/.+)|(bin\/.+)|(templates\/.+)})
end
