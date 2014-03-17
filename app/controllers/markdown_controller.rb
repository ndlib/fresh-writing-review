class MarkdownController < ApplicationController

  def new
    @markdown_content = MarkdownContent.new
  end


  def create
  end


  def show
  end


  def add_image
    md = MarkdownContent.new(content: "test")
    md.save
    i = md.images.create(:image => params[:file])
    render json: { success: true, image_path: i.image.url }
  end

end
