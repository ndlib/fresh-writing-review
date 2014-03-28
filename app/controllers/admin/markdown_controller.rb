class Admin::MarkdownController < ApplicationController

  layout 'admin'


  def edit
    @markdown_content = nil
    if MarkdownContent.exists?(params[:id])
      @markdown_content = MarkdownContent.find(params[:id])
    else
      @markdown_content = MarkdownContent.create(:content => "Edit Me")
      render :edit, id: @markdown_content.id
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
