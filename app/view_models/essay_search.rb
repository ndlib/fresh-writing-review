class EssaySearch
  include RailsHelpers

  def self.build(controller)
    self.new(controller.params)
  end

  def initialize(params)
    @params = params.permit(:keywords, :essay_style)
  end

  def search
    @search ||= EssaySolr.search(params)
  end

  def results
    search.results.collect { | e | EssayLink.new(e) }
  end

  def essay_styles
    search.facet(:essay_style_title).rows
  end

  def essay_style_options
    helpers.options_for_select(essay_styles.collect{|f| ["#{f.value} (#{f.count})", f.value]}, params[:essay_style])
  end

  private
    def params
      @params
    end
end
