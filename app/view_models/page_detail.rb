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
    MarkDownConverter.call(page.body.content)
  end


  def body_id
    page.body.id
  end

  private
    def page
      @page
    end
end
