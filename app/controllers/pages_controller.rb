class PagesController < ApplicationController

  def show
    @page_detail = PageDetail.build(self)
  end
end
