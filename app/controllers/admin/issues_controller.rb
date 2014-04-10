class Admin::IssuesController < AdminController

  layout 'admin'

  def index
    @volumes = IssueQuery.all
    @issue_list = Admin::IssueList.build(self)
  end


  def show
    @issue_detail = Admin::IssueDetail.build(self)
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


  def save_images
    @form = Admin::IssueImageForm.build(self)

    if @form.add_images!
      flash[:success] = 'Issue Images Updated'
      redirect_to admin_issue_path(@form.issue)
    else
      flash[:error] = 'Unable to update the issue image.  Please review the error messages below and correct the form.'
      redirect_to admin_issue_path(@form.issue)
    end
  end


  def publish
    issue = IssueQuery.find(params[:id])
    IssuePublisher.publish(issue)
    flash[:success] = 'Issue has been published.'
    redirect_to admin_issue_path(issue)
  end

  def unpublish
    issue = IssueQuery.find(params[:id])
    IssuePublisher.unpublish(issue)
    flash[:success] = 'Issue has been unpublished.'
    redirect_to admin_issue_path(issue)
  end


  def remove_pdf
    issue = IssueQuery.find(params[:id])
    issue.is_pdf = false

    if issue.save
      flash[:success] = "This issue is no longer a pdf issue. "
      redirect_to admin_issue_path(issue)
    else
      flash[:success] = "Unable to remove pdf only status. "
      redirect_to admin_issue_path(issue)
    end
  end

end
