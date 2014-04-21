require 'rubygems'

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup

  env = (ENV['RAILS_ENV'] || 'development').dup
  unless %w( production staging ).include? env

    require 'rails/commands/server'

    module Rails
      class Server
        alias :default_options_alias :default_options
        def default_options
          # recognized options:
          #   :Port
          #     runs Rails on the specified port
          #   :Host
          #     binds Rails to the specified IP address
          #   :config
          #     use custom rackup configuration file
          #   :daemonize
          #     make server run as a daemon
          #   :debugger
          #     enable Ruby debugging for the server
          #   :environment
          #     specifies the environment under which to run this server (e.g. 'development')
          #   :pid
          #     specifies the PID file
          default_options_alias.merge!(
            :Port => 3011,
            :debugger => true
          )
        end
      end
    end

  end

rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)