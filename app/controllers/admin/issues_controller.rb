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
    flash[:success] = 'Issue Created'
    redirect_to admin_issue_path(1)
  end


  def edit
    @form = Admin::IssueForm.build(self)
  end


  def update
    flash[:success] = 'Issue Saved'
    redirect_to admin_issue_path(1)
  end

end
