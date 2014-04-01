class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_editor!

  private

    def authenticate_editor!
      authorize! :edit, :all
    end
end
