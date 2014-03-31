class MarkdownComponentFactory::PageContent
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :page


  def initialize(params)
    @params = params
    @page = ::Page.find(@params[:page_id])
  end


  def id
    @page.id
  end


  def determine_id
    if @params[:controller] == 'admin/pages'
      @params[:id]
    else
      @params[:page_id]
    end
  end


  
end
