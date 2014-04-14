class MarkdownComponentFactory::PageContent
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :page


  def initialize(params)
    @params = params
    @page = PageQuery.find(self.determine_id)
  end


  def id
    @page.id
  end


  def component_name
    'Page Body'
  end


  def determine_id
    if @params[:controller] == 'admin/pages'
      @params[:id]
    else
      @params[:page_id]
    end
  end


  
end
