class PageDetail
  include RailsHelpers

  def self.build(controller)
    page = PageQuery.find(controller.params.require(:id))

    self.new(page)
  end

  delegate :title, :body, to: :page

  def initialize(page)
    @page = page
  end

  def body
    MarkDownConverter.call(page.body.content)
  end

  private
    def page
      @page
    end
end
