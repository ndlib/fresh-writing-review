class Admin::MarkdownController < AdminController

  layout 'admin'


  def edit
    @markdown_content = nil
    if MarkdownContent.exists?(params[:id])
      @markdown_content = MarkdownContent.find(params[:id])
    else
      mcf = MarkdownComponentFactory.create(self)
      markdown_id = nil
      if mcf.content_type == 'essay'
        markdown_id = mcf.essay.add_new_component(params[:component_type], "Please Edit")
      elsif mcf.content_type = 'issue'
        markdown_id = mcf.issue.add_new_component(params[:component_type], "Please Edit")
      elsif mcf.content_type = 'award'
        markdown_id = mcf.award.add_new_component(params[:component_type], "Please Edit")
      end
      redirect_to request.url.gsub(/new/, markdown_id.to_s)
    end
    @markdown_content
  end


  def update
    @markdown_content = MarkdownContent.find(params[:id])

    if @markdown_content.update_attributes(markdown_content_params)
      flash[:success] = "Content saved"
      redirect_to :back
    end
  end


  def add_image
    md = MarkdownContent.find(params[:id])
    i = md.images.create(:image => params[:file])
    render json: { success: true, image_path: i.image.url }
  end


  private

  def markdown_content_params
    params.require(:markdown_content).permit(:content)
  end

end
