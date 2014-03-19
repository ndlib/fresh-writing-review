class EssayDetail::DownloadFile

  include RailsHelpers

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def has_files?
    @essay.essay_files.size > 0
  end


  def title
    @essay.essay_files.first.attached_file.file_file_name
  end


  def body

  end


  def url
    @essay.essay_files.first.attached_file.file.url
  end


  def render
    if has_files?
      render_to_string '/essays/attached_files', { object: self}
    end
  end

end
