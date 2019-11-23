# config valid for current version and patch releases of Capistrano
lock '~> 3.11.1'

set :application, 'b2b_api'
set :repo_url, 'git@github.com:dimensi-tech/b2b-api.git'
set :deploy_to, '/home/deploy/apps/b2b_api'
set :branch, 'master'
set :use_sudo, false
append :linked_files, 'config/database.yml', 'config/secrets.yml', '.env'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
       'vendor/bundle', 'public/system', 'public/uploads'

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end
