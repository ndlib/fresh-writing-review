class EssayDetail

  include RailsHelpers

  def self.build(controller)
    essay = EssayQuery.find(controller.params[:id])

    self.new(essay)
  end

  delegate :title, to: :essay


  attr_accessor :essay

  def initialize(essay)
    @essay = essay
  end


  def render
    helpers.raw display_template.render
  end

  protected

    def display_template
      @template ||= determine_template_class.new(essay)
    end

    def determine_template_class
      if @essay.template == 'text'
        TextEssayDetail
      else
        MediaEssayDetail
      end
    end

end

