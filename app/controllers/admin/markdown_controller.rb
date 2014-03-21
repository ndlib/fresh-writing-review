class Admin::MarkdownController < ApplicationController

  layout 'admin'

  def new
    @markdown_content = MarkdownContent.new(:content => "Edit Me")
    @markdown_content
    @markdown_content.save
  end


  def show
  end


  def edit
    @markdown_content = MarkdownContent.find(params[:id])
  end


  def update
    @markdown_content = MarkdownContent.find(params[:id])

    if @markdown_content.update_attributes(markdown_content_params)
      flash[:success] = "Content saved"
      render :edit
      return
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
