class Page < ActiveRecord::Base

  store :data, accessors: [ :type, :content ]

end
