# Baseline for ReadOnly
# =====================
# Everything included by [`ArrayLike::ReadOnly`](read_only.html) is implemented
# in terms of these methods.  At minimum, your class must implement these
# methods.
module ArrayLike::BaselineReadOnly

  # Required Methods
  # ----------------

  # ### at

  # Returns the element at `index`.
  #
  # A negative index counts from the end of `self`. Returns `nil` if the index
  # is out of range.
  def at(index)
    raise NotImplementedError, "#{self.class}#at must be implemented for ArrayLike::ReadOnly methods!"
  end

  # ### each

  # Calls the given block once for each element in `self`, passing that element
  # as a parameter.
  #
  # If no block is given, an enumerator is returned instead.
  def each
    raise NotImplementedError, "#{self.class}#each must be implemented for ArrayLike::ReadOnly methods!"
  end

  # ### length

  # Returns the number of elements in `self`.
  #
  # While technically not required, not providing `length` would dramatically
  # hamper performance.
  def length
    raise NotImplementedError, "#{self.class}#length must be implemented for ArrayLike::ReadOnly methods!"
  end

  # Optional Methods
  # ----------------

  # Enumerates all elements beginning at the `start_at` index and ending at the
  # element at the `stop_at` index (i.e. inclusive).
  #
  # If `stop_at` is not given, `self` should be enumerated until it reaches the
  # end.
  #
  # You will want to override this method if `length` is expensive to calcuate.
  # `each_in_range` is used to perform random access on the object.
  def each_in_range(start_at, stop_at=nil)
    if start_at < 0 || (stop_at && stop_at < 0)
      raise TypeError, "Negative indexes are not supported for `each_in_range`"
    end
    if stop_at && (stop_at < start_at)
      raise TypeError, "Reverse iteration is not supported for `each_in_range` (`stop_at` must be > `start_at`, got #{start_at}..#{stop_at})"
    end

    max_index = length - 1
    return self if max_index < 0

    index   = start_at
    stop_at = stop_at ? [stop_at, max_index].min : max_index

    while index <= stop_at
      yield at(index)
      index += 1
    end
  end

end
