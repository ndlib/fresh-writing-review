namespace :db do
  desc "Drops, creates, migrates, seeds, and prepares the test database"
  task recreate: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:test:prepare"].invoke
    Rake::Task["db:seed"].invoke
  end

end
