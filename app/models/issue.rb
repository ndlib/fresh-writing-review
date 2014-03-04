class Issue < ActiveRecord::Base
  store :data, accessors: [ :editorial_notes, :editorial_board, :acknowledgments ]
end
