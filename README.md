# Fresh Writing

## Development setup

### Requirements:
1. Ruby 2.4.1 `rbenv install 2.4.1`
2. Bundler: `gem install bundler -v 1.17.3`
3. MySQL:
  * `brew install mysql`
  * `gem install mysql2 -v '0.4.10' -- --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include`
4. OpenSSL: `brew install openssl@1.0`
5. ImageMagick: ` brew install imagemagick`

Run the following commands to get the application running in development.  This assumes the root mysql account is passwordless and has permission to create databases.

### Configuration
Before running copy and configure `/config/database.example.yml` -> `/config/database.yml` and `/config/secrets.examples.yml` -> `/config/secrets.yml`

### Commands
```
export RAILS_ENV=development
export SSL=true
bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare
bundle exec rake db:seed
SSL=true bundle exec rails s
```

1. Starts a development server on port 3000: https://localhost:3000
2. Starts a local instance of solr on port 8080: http://localhost:8080/solr/#/
3. Monitors files for changes and automatically runs relevant tests (press enter to run the full test suite)
