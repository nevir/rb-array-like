# ArrayLike::Combinatorics
# ========================
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
    # Interestingly, `Array#join` is less efficient than a `map` when it
    # implicitly coerces each value to a string.  We make the assumption that
    # users of `ArrayLike` are typically not managing `String`s.
    Enumerator.new(self).map(&:to_s).join(*args)
  end

  def permutation(*args, &block)
    to_a.permutation(*args, &block)
  end

  def product(*args, &block)
    to_a.product(*args, &block)
  end

  def repeated_combination(*args, &block)
    to_a.repeated_combination(*args, &block)
  end

  def repeated_permutation(*args, &block)
    to_a.repeated_permutation(*args, &block)
  end

  def transpose(*args)
    to_a.transpose(*args)
  end

end
