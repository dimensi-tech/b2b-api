# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'
install_plugin Capistrano::Puma
set :rbenv_type, :user
set :rbenv_ruby, '2.6.3'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
