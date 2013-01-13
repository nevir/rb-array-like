# ArrayLike::Comparison
# =====================
module ArrayLike::Comparison
  include ArrayLike::BaselineReadOnly

  def <=>(obj)
    raise NotImplementedError
  end

  def ==(obj)
    raise NotImplementedError
  end

  def eql?(*args)
    raise NotImplementedError
  end

  def hash(*args)
    raise NotImplementedError
  end

end
