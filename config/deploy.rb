# Add the deploy directory to the load path
$:.unshift File.join(File.dirname(__FILE__),'deploy')
require 'hesburgh/common'
require 'hesburgh/git'
require 'hesburgh/vm'
require 'hesburgh/rails'
require 'hesburgh/rails_db'
require 'hesburgh/jenkins'
# require 'hesburgh/whenever'

set :application, 'freshwriting'
set :repository,  "git@git.library.nd.edu:fresh_writing"
set :application_symlinks, ['config/initializers/devise_secret.rb']

desc "Setup for the Pre-Production environment"
task :pre_production do
  # Customize pre_production configuration
  set :rails_env, 'pre_production'
  role :app, "fwpprd-vm.library.nd.edu"
  set :branch, "together"
end

desc "Setup for the production environment"
task :production do
  # Customize production configuration
  set :rails_env, 'production'
  role :app, "fwprod-vm.library.nd.edu"
end
