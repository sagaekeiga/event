require "capistrano/scm/git"
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rbenv'
require 'capistrano/bundler'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }


install_plugin Capistrano::SCM::Git