class Admin::IssuesController < ApplicationController

  layout 'admin'

  def index

  end


  def show

  end


  def new
    @form = Admin::IssueForm.build(self)
  end


  def create
    redirect_to admin_issue_path(1)
  end


  def edit

  end


  def update

  end

end
