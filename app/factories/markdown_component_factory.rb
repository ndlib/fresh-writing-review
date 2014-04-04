module MarkdownComponentFactory
  include RailsHelpers

  def self.create(application)
    @params = application.request.path_parameters
    if @params[:page_id] || @params[:conroller] == 'admin/pages'
      @@content_type = 'page'
      MarkdownComponentFactory::PageContent.new(@params)
    elsif @params[:award_id] || @params[:controller] == 'admin/awards'
      @@content_type = 'award'
      MarkdownComponentFactory::EssayAwardContent.new(@params)
    elsif @params[:issue_id] && @params[:essay_id] || @params[:controller] == 'admin/essays'
      @@content_type = 'essay'
      MarkdownComponentFactory::EssayContent.new(@params)
    else
      @@content_type = 'issue'
      MarkdownComponentFactory::IssueContent.new(@params)
    end
  end


  def content_type
    @@content_type
  end


end
