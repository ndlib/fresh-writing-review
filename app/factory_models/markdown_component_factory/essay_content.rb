class MarkdownComponentFactory::EssayContent
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :essay

  def initialize(params)
    @params = params
    @essay = EssayQuery.find(self.determine_id)
  end


  def id
    @essay.id
  end


  def issue_year
    @essay.issue.year
  end


  def component_name
    case @params[:id].to_i
    when @essay.body ? @essay.body.id : nil
      'Essay Body'
    when @essay.alt_body ? @essay.alt_body.id : nil
      'Transcript'
    when @essay.works_cited ? @essay.works_cited.id : nil
      'Works Cited'
    when @essay.discussion_questions ? @essay.discussion_questions.id : nil
      'Discussion Questions'
    when @essay.instructor_resources ? @essay.instructor_resources.id : nil
      'Instructor Resources'
    when @essay.author_biography ? @essay.author_biography.id : nil
      'Author Biography'
    when @essay.embed ? @essay.embed.id : nil
      'Embedded Multimedia'
    else
      'Unidentified Markdown'
    end
  end


  def determine_id
    if @params[:controller] == 'admin/essays'
      @params[:id]
    else
      @params[:essay_id]
    end
  end

end
