# Add the deploy directory to the load path
$:.unshift File.join(File.dirname(__FILE__),'deploy')
require 'hesburgh/common'
require 'hesburgh/git'
require 'hesburgh/vm'
require 'hesburgh/rails'
require 'hesburgh/rails_db'
require 'hesburgh/jenkins'

set :application, 'freshwriting'
set :repository,  "https://github.com/ndlib/fresh-writing.git"
set :application_symlinks, ['config/initializers/devise_secret.rb']

desc "Setup for the Pre-Production environment"
task :pre_production do
  # Customize pre_production configuration
  set :rails_env, 'pre_production'
  role :app, "libnd-freshwriting.lc.nd.edu"
  set :branch, "master"
end

desc "Setup for the production environment"
task :production do
  # Customize production configuration
  set :rails_env, 'production'
  role :app, "freshwriting.lc.nd.edu"
end
