class MarkdownComponentFactory::EssayAwardContent 
  include RailsHelpers
  include MarkdownComponentFactory


  def initialize(params)
    @params = params
    @essay_award = ::EssayAward.find(params[:essay_award_id])
  end


  def id
    @essay_award.id
  end

end
