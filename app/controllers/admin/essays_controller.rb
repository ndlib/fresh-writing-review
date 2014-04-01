class Admin::EssaysController < AdminController

  layout 'admin'

  def show
    @essay_detail = Admin::EssayDetail.new(self)
  end


  def new
    @form = Admin::EssayForm.build(self)
  end


  def create
    @form = Admin::EssayForm.build(self)

    if @form.save!
      flash[:success] = 'Essay Created'
      redirect_to admin_issue_essay_path(@form.issue, @form.essay)
    else
      flash.new[:error] = 'Unable to create the essay.  Please review the error messages below and correct the form.'
      render :new
    end
  end


  def edit
    @form = Admin::EssayForm.build(self)
  end


  def update
    @form = Admin::EssayForm.build(self)

    if @form.save!
      flash[:success] = 'Essay Saved'
      redirect_to admin_issue_essay_path(@form.issue, @form.essay)
    else
      flash.new[:error] = 'Unable to update the essay.  Please review the error messages below and correct the form.'
      render :new
    end
  end

end
