# ArrayLike::Indexing
# ===================
module ArrayLike::Indexing
  include ArrayLike::BaselineReadOnly

  def [](*args)
    raise NotImplementedError
  end
  alias_method :slice, :[]

  def fetch(*args)
    raise NotImplementedError
  end

  def first(*args)
    raise NotImplementedError
  end

  def last(*args)
    raise NotImplementedError
  end

  def sample(*args)
    raise NotImplementedError
  end

  def take(*args)
    raise NotImplementedError
  end

end
