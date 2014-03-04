Capistrano::Configuration.instance(:must_exist).load do

  _cset(:deploy_to) { "/home/app/#{application}" }

  _cset :user,      'app'
  _cset :use_sudo, false

  set :ruby_bin, "/opt/ruby/current/bin"

end
