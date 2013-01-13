module ArrayLike::Combinatorics
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Coercion

  def *(value)
    to_a * value
  end

  def combination(*args, &block)
    to_a.combination(*args, &block)
  end

  def join(*args)
    # Interestingly, `Array#join` is less efficient when it implicitly coerces
    # each value to a string; `map` gives us the best compromise in perf.
    Enumerator.new(self).map(&:to_s).join(*args)
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
