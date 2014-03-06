class TextEssayDetail

  include RailsHelpers

  attr_accessor :essay
  delegate :alt_title, :alt_body, to: :essay

  def initialize(essay)
    @essay = essay
  end


  def body
    MarkDownConverter.call(@essay.body)
  end


  def title
    @essay.title
  end


  def render
    ApplicationController.new.render_to_string(partial: '/essays/text_template', locals: { object: self })
  end


  def alternate_body(&block)
    if show_alt_body?
      yield
    end
  end



  def render_values
    { partial: '/essays/text_template', locals: { object: self }}
  end


  protected

    def show_alt_body?
      @essay.alt_body.present?
    end



end
