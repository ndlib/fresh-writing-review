class EssaySolr
  def self.search(params = {})
    new(params).search
  end

  def initialize(params = {})
    @params = params
  end

  def search
    @search ||= Essay.search do
      fulltext(params[:keywords])
      if params[:essay_style].present?
        with(:essay_style_title, params[:essay_style])
      end

      order_by(:score, :desc)
      order_by(:sort_title, :asc)

      facet :essay_style_title
    end
  end

  private
    def params
      @params
    end
end
