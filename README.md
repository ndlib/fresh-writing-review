# Fresh Writing

## Development setup

Requirements:
1. Ruby 2.1.x
2. Bundler: `gem install bundler`
3. MySQL

Run the following commands to get the application running in development.  This assumes the root mysql account is passwordless and has permission to create databases.

```
bundle
rake db:create
rake db:migrate
rake db:test:prepare
guard
```

`guard` does the following:
1. Starts a development server on port 3015: http://localhost:3015
2. Starts a local instance of solr on port 8080: http://localhost:8080/solr/#/
3. Monitors files for changes and automatically runs relevant tests (press enter to run the full test suite)

While guard is running you need to populate some initial data by running:

```
rake db:seed
```
