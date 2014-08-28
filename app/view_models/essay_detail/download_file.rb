class EssayDetail::DownloadFile < Draper::Decorator

  def self.render(attached_file)
    self.new(attached_file).render
  end

  delegate :title, :body, :file, to: :attached_file

  def attached_file
    object
  end

  def url
    file.url
  end


  def render
    h.render partial: '/essays/attached_files', locals: { object: self}
  end

end
