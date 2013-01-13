# ArrayLike::Comparison
# =====================
module ArrayLike::Comparison
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Coercion

  # <=>
  # ---

  # Returns an integer (`-1`, `0`, or `+1`) if this array is less than, equal
  # to, or greater than other_ary.
  #
  # Each object in each array is compared (using `<=>`). If any value isn’t
  # equal, then that inequality is the return value.  If all the values found
  # are equal, then the return is based on a comparison of the array lengths.
  def <=>(obj)
    to_a <=> obj
  end

  # ==
  # --

  # Two arrays are equal if they contain the same number of elements and if each
  # element is equal to the corresponding element (according to `==`) in the
  # other array.
  def ==(obj)
    to_a == obj
  end

  # eql?
  # ----

  # Returns true if self and other are the same object, or are both arrays with
  # the same content.
  def eql?(other)
    return true  if super # `Object#eql?` wins if `true`.
    return false if length != other.length

    to_a.eql? other.to_a
  end

  # hash
  # ----

  # Compute a hash-code for this array. Two arrays with the same content will
  # have the same hash code (and will compare using `eql?`).
  def hash
    to_a.hash
  end

end
