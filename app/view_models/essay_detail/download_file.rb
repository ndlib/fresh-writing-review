class EssayDetail::DownloadFile

  include RailsHelpers

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def has_files?
    @essay.attached_file.present?
  end


  def title
    @essay.attached_file.title
  end


  def body
    @essay.attached_file.body
  end


  def url
    @essay.attached_file.file.url
  end


  def render
    if has_files?
      render_to_string '/essays/attached_files', { object: self}
    end
  end

end
