class Admin::EssayForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :title, String
  attribute :author, String
  attribute :essay_style_id, Integer

  attr_accessor :essay

  validates :title, :author, :essay_style_id, presence: true

  def self.build(controller)
    if controller.params[:id]
      essay = EssayQuery.find(controller.params[:id])
    else
      essay = Essay.new
    end

    self.new(essay, controller.params)
  end


  def initialize(essay, params = {})
    @essay = essay

    if params[:admin_essay_form]
      self.attributes = params[:admin_essay_form]
    else
      self.attributes = essay.attributes
    end
  end


  def page_title
    if essay.new_record?
      "New Essay"
    else
      "Edit #{essay.title}"
    end
  end


  def essay_style_options
    EssayStyleQuery.all.collect { | es | [ es.title, es.id] }
  end

end
