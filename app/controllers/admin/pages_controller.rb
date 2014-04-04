class Admin::PagesController < AdminController
  def index
    @pages = PageQuery.all
  end

  def edit
    @page = PageQuery.find(params[:id])
  end

  def update
    @page = PageQuery.find(params[:id])

    if @page.update_attributes(params.require(:page).permit(:title))
      flash[:success] = "Page \"#{@page.title}\" updated"
      redirect_to admin_pages_path()
    else
      render action: :edit
    end
  end

end
