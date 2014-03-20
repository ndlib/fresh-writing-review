class EssayDetail::Nav

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end

  def initialize(essay)
    @essay = essay
  end


  def issue_link
    IssueDetail.new(essay.issue).link_to_show('tool-link volume')
  end


  def style_link
    helpers.link_to(@essay.essay_style.title, routes.issue_essay_style_path(@essay.issue.friendly_id, @essay.essay_style), class: 'tool-link style')
  end


  def discussion_questions_link
    EssayDetail::DiscussionQuestions.render(@essay)
  end


  def instructor_rescouces_link
    EssayDetail::InstructorResources.new(@essay).link_to_detail("tool-link instructor")
  end


  def author_biography_link
    if EssayDetail::AuthorBiography.new(essay).has_content?
      helpers.link_to helpers.raw("Author<br>Biography"), "#author_biography", class: "author tool-link"
    end
  end


  def works_cited_link
    if EssayDetail::WorksCited.new(essay).has_content?
      helpers.link_to "Works Cited", "#works_cited", class: "cited tool-link"
    end
  end


  def top_of_page_link
    helpers.link_to("Top of Page", "#", target: "_top", class: "top tool-link")
  end

  def render
    render_to_string '/essays/nav', { object: self }
  end
end
