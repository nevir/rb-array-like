module ArrayLike::SetLikeOperations
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Enumeration

  def &(other)
    to_a & other
  end

  def |(other)
    to_a | other
  end

  def +(other)
    to_a + other
  end

  def -(other)
    to_a - other
  end

end
