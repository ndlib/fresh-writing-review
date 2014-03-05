

class EssayDetail

  include RailsHelpers

  def self.build(controller)
    essay = EssayQuery.find(controller.params[:id])

    self.new(essay)
  end

  attr_accessor :essay

  delegate :title, to: :essay


  def initialize(essay)
    @essay = essay
  end


  def body_top
    @essay.body
  end


  def body_bottom

  end


  def media_bar

  end

  def body
  end


  private

    def detail_type
      if @essay.embed.present?
        YouTubeVideoEssayDetail.new()
      else

      end
    end
end



class TextEssayDetail
  def body

  end
end


class YouTubeVideoEssayDetail
  def body

  end
end

class CalturaVideoEssayDetail
end

class CalturaAudioEssayDetail
end

class ImageGalleryEssayDetail
end

