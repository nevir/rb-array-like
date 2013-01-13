# ArrayLike::Deletion
# ===================
module ArrayLike::Deletion
  include ArrayLike::BaselineWritable

  # clear
  # -----

  # Removes all elements from `self`.
  def clear
    raise NotImplementedError
  end

  # compact!
  # --------

  # Removes `nil` elements from the array.
  #
  # Returns `nil` if no changes were made, otherwise returns `self`.
  def compact!
    raise NotImplementedError
  end

  # delete
  # ------

  # Deletes items from `self` that are equal to `obj`.
  #
  # If any items are found, returns `obj`, otherwise returns `nil`.
  # If a block is given, returns the result of block if the item is not found.
  def delete(obj, &block)
    raise NotImplementedError
  end

  # delete_at
  # ---------

  # Deletes the element at the specified index, returning that element, or `nil`
  # if the index is out of range.
  def delete_at(index)
    raise NotImplementedError
  end

  # delete_if
  # ---------

  # Passes each element in `self` to the given block, and deletes any element
  # that is given a value of `true` from the block.
  #
  # If no block is given, an enumerator is returned instead.
  def delete_if(&block)
    raise NotImplementedError
  end

  # keep_if
  # -------

  # Passes each element in `self` to the given block, and deletes any element
  # that is given a value of `false` from the block.
  #
  # If no block is given, an enumerator is returned instead.
  def keep_if(&block)
    raise NotImplementedError
  end

  # pop
  # ---

  # Removes the last element from `self` and returns it, or `nil` if the array
  # is empty.
  #
  # If a number `n` is given, removes `n` items from the end of the array and
  # returns them.
  def pop(n=nil)
    raise NotImplementedError
  end

  # reject!
  # -------

  # Identical to [`delete_if`](#delete_if), except that `nil` is returned if no
  # elements were removed.
  def reject!(&block)
    raise NotImplementedError
  end

  # select!
  # -------

  # Identical to [`keep_if`](#keep_if), except that `nil` is returned if no
  # elements were removed.
  def select!(&block)
    raise NotImplementedError
  end

  # shift
  # -----

  # Removes the first element from `self` and returns it, or `nil` if the array
  # is empty.
  #
  # If a number `n` is given, removes `n` items from the start of the array and
  # returns them.
  def shift(n=nil)
    raise NotImplementedError
  end

  # slice!
  # ------

  # Deletes the element(s) given by an index (optionally with a length) or by a
  # range.
  #
  # Returns the deleted object (or objects), or `nil` if the index is out of
  # range.
  def slice!(*args)
    raise NotImplementedError
  end

end
