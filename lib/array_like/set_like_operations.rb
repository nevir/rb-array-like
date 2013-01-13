# ArrayLike::SetLikeOperations
# ============================
module ArrayLike::SetLikeOperations
  include ArrayLike::BaselineReadOnly
  include ArrayLike::Coercion

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
