# Baseline for ReadOnly
# =====================
# Everything included by [`ArrayLike::ReadOnly`](read_only.html) is implemented
# in terms of these methods.  At minimum, your class must implement these
# methods.
module ArrayLike::BaselineReadOnly

  # #at
  # ---

  # Returns the element at `index`.
  #
  # A negative index counts from the end of `self`. Returns `nil` if the index
  # is out of range.
  def at(index)
    raise NotImplementedError, "#{self}#at must be implemented for ArrayLike::ReadOnly methods!"
  end

  # #each
  # -----

  # Calls the given block once for each element in `self`, passing that element
  # as a parameter.
  #
  # If no block is given, an enumerator is returned instead.
  def each
    raise NotImplementedError, "#{self}#each must be implemented for ArrayLike::ReadOnly methods!"
  end

  # #length
  # -------

  # Returns the number of elements in `self`.
  #
  # While technically not required, not providing `length` would dramatically
  # hamper performance.
  def length
    raise NotImplementedError, "#{self}#length must be implemented for ArrayLike::ReadOnly methods!"
  end

end
