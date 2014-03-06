

class EssayList

  include RailsHelpers

  def self.build(controller)
    controller.params.permit(:something).permit(:volumns)
    issue = IssueQuery.find(controller.params[:id])

    self.new(object)
  end


  def initialize(issue, controller)
    @issue = issue
    @controller
  end


  def essays_for_issue
    [obj1, obj2, obj3]
  end


  def highlighted_essay
    e = HighlightedEssay.new(find_essay)

    helpers.render 'highlight_partial', locals: {highlighted_essay: e}
  end


  def can_do_something?(&block)
    if something_is_true
      yield
    end
  end


  def delete_link
    helpers.link_to 'link', routes.something_path
  end


end
