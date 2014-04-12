class MarkdownComponentFactory::EssayStyleContent
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :essay_style

  def initialize(params)
    @params = params
    @essay_style = EssayStyleQuery.find(self.determine_id)
  end


  def id
    @essay_style.id
  end


  def component_name
    'Description'
  end


  def determine_id
    if @params[:controller] == 'admin/essay_styles'
      @params[:id]
    else
      @params[:essay_style_id]
    end
  end

end
