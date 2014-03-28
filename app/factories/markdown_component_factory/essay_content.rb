class MarkdownComponentFactory::EssayContent
  include RailsHelpers
  include MarkdownComponentFactory


  def initialize(params)
    @params = params
    @essay = ::Essay.exists?(params[:essay_id] ? ::Essay.find(params[:essay_id]) : nil
  end


  def id
    @essay.id
  end


  def issue_year
    @essay.issue.year
  end
end
