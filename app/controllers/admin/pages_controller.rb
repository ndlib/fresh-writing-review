class Admin::PagesController < AdminController
  def index
    @pages = PageQuery.all
  end

  def edit
  end

  def update
  end

end
