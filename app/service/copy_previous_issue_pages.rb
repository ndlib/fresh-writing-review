class CopyPreviousIssuePages
  attr_accessor :to_issue

  def self.call(to_issue)
    self.new(to_issue).copy!
  end


  def initialize( to_issue)
    @to_issue = to_issue
  end


  def copy!
    copy_page!(:acknowledgements)
    copy_page!(:editorial_board)
    copy_page!(:editorial_notes)

    to_issue.save!
  end


  def previous_issue
    @lasy_issue ||= IssueQuery.previous_issue
  end

  private

    def copy_page!(page)
      if page_does_not_already_exist?(page)
        mc = MarkdownContent.new(content: previous_issue.send(page).content)
        to_issue.send("#{page}=", mc)
      end
    end


    def page_does_not_already_exist?(page)
      to_issue.send(page).nil?
    end
end
