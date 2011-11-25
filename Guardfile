require 'guard/guard'
require 'colorize'

module ::Guard
  class RakeInstall < Guard
    def start

    end

    def stop

    end

    def reload
      stop
      start
    end

    def run_all
      true
    end

    def run_on_change(paths)
      `rake install`
    end

  end
end

# Available options: :pidfile, :port, :executable
guard 'rake-install' do
  watch %r{.+}
end
