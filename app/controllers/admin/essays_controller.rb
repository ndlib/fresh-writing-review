class Admin::EssaysController < AdminController

  layout 'admin'

  def show
    @essay_detail = Admin::EssayDetail.build(self)
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

  def destroy
    @essay = EssayQuery.find(params[:id])
    @essay.destroy!
    flash[:success] = "Essay \"#{@essay.title}\" deleted"
    redirect_to admin_issue_path(params[:issue_id])
  end

  def publish
    essay = EssayQuery.find(params[:id])
    EssayPublisher.publish(essay)
    redirect_to admin_issue_essay_path(essay.issue, essay)
  end

  def unpublish
    essay = EssayQuery.find(params[:id])
    EssayPublisher.unpublish(essay)
    redirect_to admin_issue_essay_path(essay.issue, essay)
  end

end
