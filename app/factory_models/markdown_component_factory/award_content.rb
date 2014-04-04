class MarkdownComponentFactory::AwardContent
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :award

  def initialize(params)
    @params = params
    @award = AwardQuery.find(self.determine_id)
  end


  def id
    @award.id
  end


  def determine_id
    if @params[:controller] == 'admin/awards'
      @params[:id]
    else
      @params[:award_id]
    end
  end



end
