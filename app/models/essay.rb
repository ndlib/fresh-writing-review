
class Essay < ActiveRecord::Base
  store :data, accessors: [ :body ]
end
