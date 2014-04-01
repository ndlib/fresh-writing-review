class Admin::EditorsController < ApplicationController

  layout 'admin'

  def index
    @editors = EditorQuery.all
  end

end
