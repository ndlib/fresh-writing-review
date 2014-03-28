class MarkdownComponentFactory::PageContent
  include RailsHelpers
  include MarkdownComponentFactory


  def initialize(params)
    @params = params
    @page = ::Page.find(@params[:page_id])
  end


  def id
    @page.id
  end
  
end
