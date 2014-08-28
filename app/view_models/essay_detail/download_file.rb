class EssayDetail::DownloadFile < Draper::Decorator

  def self.render(essay)
    self.new(essay).render
  end


  def essay
    object
  end


  def has_files?
    essay.attached_file.present?
  end


  def title
    essay.attached_file.title
  end


  def body
    essay.attached_file.body
  end


  def url
    essay.attached_file.file.url
  end


  def render
    if has_files?
      h.render partial: '/essays/attached_files', locals: { object: self}
    end
  end

end
