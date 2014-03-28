module MarkdownComponentFactory
  include RailsHelpers

  def self.create(application)
    @params = application.request.params
    if @params[:page_id]
      MarkdownComponentFactory::PageContent.new(@params)
    elsif @params[:essay_award_id]
      MarkdownComponentFactory::EssayAwardContent.new(@params)
    elsif @params[:issue_id] && @params[:essay_id]
      MarkdownComponentFactory::EssayContent.new(@params)
    else
      MarkdownComponentFactory::IssueContent.new(@params)
    end
  end


end
