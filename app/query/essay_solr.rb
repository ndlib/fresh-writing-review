class EssaySolr
  def self.search(params = {})
    new(params)
  end

  def initialize(params = {})
    @params = params
  end

  def search
    @search ||= Essay.search do
      fulltext params[:q] do
        boost_fields title: 2.0, author: 1.5, body_plain: 1.3
      end

      with(:published, true)

      if params[:style].present?
        essay_style_filter = with(:essay_style_title, params[:style])
        facet :essay_style_title, exclude: [essay_style_filter]
      else
        facet :essay_style_title
      end

      if params[:issue].present?
        issue_filter = with(:issue_year, params[:issue])
        facet :issue_year, exclude: [issue_filter]
      else
        facet :issue_year
      end

      if params[:medium].present?
        medium_filter = with(:medium, params[:medium])
        facet :medium, exclude: [medium_filter]
      else
        facet :medium
      end

      order_by(:score, :desc)
      order_by(:sort_title, :asc)

      paginate page: params[:page], per_page: 10
    end
  end

  def results
    search.results
  end

  def facet(facet_name)
    search.facet(facet_name)
  end

  private
    def params
      @params
    end
end
