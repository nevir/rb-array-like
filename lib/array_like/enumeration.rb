module ArrayLike::Enumeration
  include ArrayLike::BaselineReadOnly
  include Enumerable

  def assoc(*args)
    raise NotImplementedError
  end

  def compact(*args)
    raise NotImplementedError
  end

  def each_index(*args)
    raise NotImplementedError
  end

  def flatten(*args)
    raise NotImplementedError
  end

  def pack(*args)
    raise NotImplementedError
  end

  def rassoc(*args)
    raise NotImplementedError
  end

  def reverse(*args)
    raise NotImplementedError
  end

  def rindex(*args)
    raise NotImplementedError
  end

  def rotate(*args)
    raise NotImplementedError
  end

  def shuffle(*args)
    raise NotImplementedError
  end

  # Too many other functions make the assumption that this returns an explicit
  # `Array`; it doesn't look like we can take advantage of implicit coercion.
  #
  # http://bugs.ruby-lang.org/issues/7657 for example.
  alias_method :to_ary, :to_a

  def uniq(*args)
    raise NotImplementedError
  end

  def values_at(*args)
    raise NotImplementedError
  end

end
