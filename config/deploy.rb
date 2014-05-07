# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'newappetite-www'
set :repo_url, 'git@gitlab.com:anuforok/newappetite-new.git'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#set :ssh_options, { :forward_agent => true }
#
set :bundle_without, [:darwin, :development, :test]

set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :linked_files, %w{config/database.yml} 

# This does not work for some reason
#set(:symlinks, [
#  {
#    source: "etc/nginx.conf",
#    link: "/opt/local/etc/nginx/nginx.conf" #sites-enabled/#{fetch(:full_app_name)}"
#  }
#])


namespace :deploy do
  after 'deploy:started', :setup

  desc 'Restart application'
  task :restart do
    on roles(:www), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      execute :rm, '-f /opt/local/etc/nginx/nginx.conf'
      execute :ln, '-s /var/www/current/etc/nginx.conf /opt/local/etc/nginx/nginx.conf'
      execute :svccfg, :import, release_path.join('config/unicorn.smf')
      execute :svcadm, :restart, :www
      execute :svcadm, :restart, :nginx
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:www), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
