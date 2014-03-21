class EssaySearch

  def self.build(controller)
    self.new(controller.params)
  end

  def initialize(params)
    @params = params.permit(:keywords)
  end

  def search
    Essay.search do
      fulltext(params[:keywords])

      order_by(:score, :desc)
      order_by(:sort_title, :asc)
    end
  end

  def results
    search.results.collect { | e | EssayLink.new(e) }
  end

  private
    def params
      @params
    end
end
