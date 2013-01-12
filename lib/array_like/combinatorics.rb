module ArrayLike::Combinatorics
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Enumeration

  def *(value)
    to_a * value
  end

  def combination(*args)
    raise NotImplementedError
  end

  def join(*args)
    raise NotImplementedError
  end

  def permutation(*args)
    raise NotImplementedError
  end

  def product(*args)
    raise NotImplementedError
  end

  def repeated_combination(*args)
    raise NotImplementedError
  end

  def repeated_permutation(*args)
    raise NotImplementedError
  end

  def transpose(*args)
    raise NotImplementedError
  end

end
