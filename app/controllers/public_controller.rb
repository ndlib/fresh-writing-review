class PublicController < ApplicationController
  before_filter :authenticate_user!, only: :logged_in

  def home
  end

  def logged_in
  end
end
