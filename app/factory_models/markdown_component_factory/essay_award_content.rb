class MarkdownComponentFactory::EssayAwardContent 
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :essay_award

  def initialize(params)
    @params = params
    @essay_award = EssayAwardQuery.find(self.determine_id)
  end


  def id
    @essay_award.id
  end


  def determine_id
    if @params[:controller] == 'admin/essay_awards'
      @params[:id]
    else
      @params[:essay_award_id]
    end
  end



end
