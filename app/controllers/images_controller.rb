class ImagesController < ApplicationController

  def show
    i = Image.find(params[:id])
    send_file(
      i.image.path, 
      filname: i.image.instance.image_file_name, 
      type: i.image.instance.image_content_type,
      disposition: 'inline'
    )
  end
end
