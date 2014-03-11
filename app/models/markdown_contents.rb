class Page < ActiveRecord::Base

  store :data, accessors: [ :content ]

end
