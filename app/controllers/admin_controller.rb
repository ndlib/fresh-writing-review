class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_editor!

  layout 'admin'
end
