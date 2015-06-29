class PageDetail
  include RailsHelpers

  def self.build(controller)
    page = PageQuery.find(controller.params.require(:id))

    self.new(page)
  end

  delegate :title, :body, :slug, to: :page

  def initialize(page)
    @page = page
  end

  def body
    markdown_object.to_html
  end


  def body_id
    page.body.id
  end

  protected

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(page.body)
    end

  private
    def page
      @page
    end
end
