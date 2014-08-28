class EssayDetail::CompanionMaterial < Draper::Decorator

  def self.render(essay)
    self.new(essay).render
  end

  def essay
    object
  end

  def files
    essay.attached_files
  end

  def has_files?
    files.present?
  end

  def decorated_files
    EssayDetail::DownloadFile.decorate_collection(files)
  end

  def render
    if has_files?
      h.render partial: '/essays/companion_material', locals: { object: self}
    end
  end

end
