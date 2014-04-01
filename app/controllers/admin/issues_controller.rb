class Admin::IssuesController < ApplicationController

  layout 'admin'

  def index
    @volumes = IssueQuery.all
  end


  def show
    @issue_detail = IssueDetail.new(self)
  end


  def new
    @form = Admin::IssueForm.build(self)
  end


  def create
    @form = Admin::IssueForm.build(self)

    if @form.save!
      flash[:success] = 'Issue Created'
      redirect_to admin_issue_path(@form.issue)
    else
      flash.new[:error] = 'Unable to create the issue.  Please review the error messages below and correct the form.'
      render :new
    end
  end


  def edit
    @form = Admin::IssueForm.build(self)
  end


  def update
    @form = Admin::IssueForm.build(self)

    if @form.save!
      flash[:success] = 'Issue Updated'
      redirect_to admin_issue_path(@form.issue)
    else
      flash.new[:error] = 'Unable to update the issue.  Please review the error messages below and correct the form.'
      render :new
    end
  end

end
