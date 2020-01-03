require 'hesburgh_infrastructure'
# application_name must match an application in the hesburgh_infrastructure gem
# New applications must be added to config/applications.yml in hesburgh_infrastructure
hesburgh_guard = HesburghInfrastructure::Guard.new(:fresh_writing, self)

# Automatically compile CoffeeScript files
# https://github.com/guard/guard-coffeescript
hesburgh_guard.coffeescript

# Automatically install/update your gem bundle when needed
# https://github.com/guard/guard-bundler
hesburgh_guard.bundler gemspec: false do
  # Watch any custom paths
end

# Automatically start/restart your Rails development server
# https://github.com/ranmocy/guard-rails
hesburgh_guard.rails port: 3000 do
  # Watch any custom paths

  callback(:start_end) do
    UI.info("Starting Solr Server")
    output = `bundle exec rake sunspot:solr:start`
    puts output
  end
  callback(:stop_end) do
    UI.info("Stopping Solr Server")
    # For some reason guard hangs if this command isn't run as a fork
    # Output is muted so it doesn't pollute the terminal
    job1 = fork do
      output = `bundle exec rake sunspot:solr:stop > /dev/null 2>&1`
    end
    Process.detach(job1)
  end
end

# Intelligently start/reload your RSpec Drb spork server
# https://github.com/guard/guard-spork
hesburgh_guard.spork do
  # Watch any custom paths
end

# Automatically run your specs
# https://github.com/guard/guard-rspec
hesburgh_guard.rspec do
  # Watch any custom paths
end
