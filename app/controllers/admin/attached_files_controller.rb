class Admin::AttachedFilesController < AdminController

  def new
    @attached_file = AttachedFile.new
  end

  def create
    @attached_file = AttachedFile.new(params.require(:attached_file).permit(:file, :title, :body))

    if @attached_file.save
      flash[:success] = "File \"#{@attached_file.title}\" uploaded"
      redirect_to admin_issue_essay_path(params[:issue_id], params[:essay_id])
    else
      render action: :new
    end
  end

  def edit
    @attached_file = AttachedFile.find(params[:id])
  end

  def update
    @attached_file = AttachedFile.find(params[:id])

    if @attached_file.update_attributes(params.require(:attached_file).permit(:file, :title, :body))
      flash[:success] = "File \"#{@attached_file.title}\" saved"
      redirect_to admin_issue_essay_path(params[:issue_id], params[:essay_id])
    else
      render action: :edit
    end
  end

  def destroy
    @attached_file = AttachedFile.find(params[:id])
    @attached_file.destroy
    flash[:success] = "File \"#{@attached_file.title}\" deleted"
    redirect_to admin_issue_essay_path(params[:issue_id], params[:essay_id])
  end

end
