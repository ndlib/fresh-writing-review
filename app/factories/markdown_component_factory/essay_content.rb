class MarkdownComponentFactory::EssayContent
  include RailsHelpers
  include MarkdownComponentFactory


  attr_accessor :essay


  def initialize(params)
    @params = params
    @essay = ::Essay.exists?(self.determine_id) ? ::Essay.find(self.determine_id) : nil
  end


  def id
    @essay.id
  end


  def issue_year
    @essay.issue.year
  end


  def determine_id
    if @params[:controller] == 'admin/essays'
      @params[:id]
    else
      @params[:essay_id]
    end
  end

end
