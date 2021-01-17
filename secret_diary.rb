class SecretDiary
  def initialize(diary)
    @diary = diary
    @locked = true
  end

  def read(page)
    return @diary.read(page) unless @locked
    :forbidden
  end

  def unlock
    @locked = false
  end

  def locked?
    @locked
  end
end
