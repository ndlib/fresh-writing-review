task :stats => "todolist:statsetup"

namespace :todolist do
  task :statsetup do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << ["Policies", "app/policy"]
    ::STATS_DIRECTORIES << ["Services", "app/service"]
    ::STATS_DIRECTORIES << ["View Models", "app/view_models"]
    ::STATS_DIRECTORIES << ["Query", "app/query"]
    ::STATS_DIRECTORIES << ["Form", "app/forms"]
    ::STATS_DIRECTORIES << ["Factory Models", "app/factory_models"]
  end
end
