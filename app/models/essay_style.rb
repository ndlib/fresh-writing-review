class EssayStyle < ActiveRecord::Base
  store :data, accessors: [ :title ]
end
