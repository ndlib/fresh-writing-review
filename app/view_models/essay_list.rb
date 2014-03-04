

class EssayList

  include RailsHelpers

  def self.build(controller)
    essay = EssayQuery.find(controller.params[:id])

    self.new(essay)
  end


  delegate :title, to: :essay


  def initialize(essay)
    @essay = essay
  end


  def body
    MarkDownConverter.call(@essay.body)
  end




end
