# ArrayLike::Combinatorics
# ========================
module ArrayLike::Combinatorics
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Coercion

  # *
  # -

  # If an `Integer` value is given, returns a new `Array` built by concatenating
  # `value` copies of `self` together.
  #
  # If a `String` is given, the result is equivalent to `join(value)`.
  def *(value)
    return join(value) if value.is_a? String

    to_a * value
  end

  # combination
  # -----------

  # Computes all combinations of `len` elements.
  #
  # If a block is given, each combination is yielded to the block.  If no block
  # is given, an `Enumerator` for the combinations is returned.
  def combination(len, &block)
    to_a.combination(len, &block)
  end

  # join
  # ----

  # Returns a `String` created by converting each element to a `string`,
  # separated by `sep`.
  def join(sep=$,)
    # Interestingly, `Array#join` is less efficient than a `map` when it
    # implicitly coerces each value to a string.  We make the assumption that
    # users of `ArrayLike` are typically not managing `String`s.
    to_enum.map(&:to_s).join(sep)
  end

  # permutation
  # -----------

  # Computes all permutations of `len` elements.
  #
  # If a block is given, each permutation is yielded to the block.  If no block
  # is given, an `Enumerator` for the permutations is returned.
  def permutation(len=nil, &block)
    # MRI accepts `nil` as no arg, Rubinius and JRuby don't.
    to_a.permutation(*[len].compact, &block)
  end

  # product
  # -------

  # Computes all combinations of `len` elements between `self` and the given
  # array(s).
  #
  # If a block is given, each combination is yielded to the block.  If no block
  # is given, an `Enumerator` for the combinations is returned.
  def product(*other_arrays, &block)
    to_a.product(*other_arrays, &block)
  end

  # repeated_combination
  # --------------------

  # Computes all combinations of `len` elements, including combinations with
  # the same element repeated.
  #
  # If a block is given, each combination is yielded to the block.  If no block
  # is given, an `Enumerator` for the combinations is returned.
  def repeated_combination(len, &block)
    to_a.repeated_combination(len, &block)
  end

  # repeated_permutation
  # --------------------

  # Computes all permutations of `len` elements, including permutations with
  # the same element repeated.
  #
  # If a block is given, each permutation is yielded to the block.  If no block
  # is given, an `Enumerator` for the permutations is returned.
  def repeated_permutation(len, &block)
    to_a.repeated_permutation(len, &block)
  end

  # transpose
  # ---------

  # Assumes that `self` contains only `Array`s of the same length, and
  # transposes the rows and columns.
  def transpose
    to_a.transpose
  end

end
