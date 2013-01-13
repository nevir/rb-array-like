# ArrayLike::Inspection
# =====================
module ArrayLike::Inspection
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Coercion

  # empty?
  # ------

  # Returns `true` if self contains no elements.
  def empty?
    length == 0
  end

  # to_s
  # ----

  # Returns a string representation of the elements contained within `self`.
  def to_s
    to_a.to_s
  end

  # inspect
  # -------

  # Returns an informative and human-readable, representation of `self`.
  def inspect
    "<#{self.class} #{to_s}>"
  end

  # size
  # ----

  # Returns the number of elements in `self`.
  def size
    length
  end

end
