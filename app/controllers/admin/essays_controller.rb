class Admin::EssaysController < ApplicationController

  layout 'admin'

  def show

  end


  def new
    @form = Admin::EssayForm.build(self)
  end


  def create
    flash[:success] = 'Essay Created'
    redirect_to admin_issue_essay_path(1, 1)
  end


  def edit
    @form = Admin::EssayForm.build(self)
  end


  def update
    flash[:success] = 'Essay Saved'
    redirect_to admin_issue_essay_path(1, 1)
  end


end
