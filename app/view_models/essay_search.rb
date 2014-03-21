class EssaySearch
  include RailsHelpers

  def self.build(controller)
    self.new(controller.params)
  end

  def initialize(params)
    @params = params.permit(:q, :style, :issue, :medium)
  end

  def search
    @search ||= EssaySolr.search(params)
  end

  def results
    search.results.collect { | e | EssayLink.new(e) }
  end

  def keywords
    params[:q]
  end

  def essay_styles
    search.facet(:essay_style_title).rows
  end

  def essay_style_options
    helpers.options_for_select(essay_styles.collect{|f| ["#{f.value} (#{f.count})", f.value]}, params[:style])
  end

  def issues
    search.facet(:issue_year).rows
  end

  def issue_options
    helpers.options_for_select(issues.collect{|f| ["#{f.value} (#{f.count})", f.value]}, params[:issue])
  end

  def mediums
    search.facet(:medium).rows
  end

  def medium_options
    helpers.options_for_select(mediums.collect{|f| ["#{f.value} (#{f.count})", f.value]}, params[:medium])
  end

  private
    def params
      @params
    end
end
