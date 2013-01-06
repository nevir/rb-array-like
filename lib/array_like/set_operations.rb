module ArrayLike; end
module ArrayLike::SetOperations
  include ArrayLike::Coercion

  def &(other_array)
    to_a & other_array
  end

  def *(value)
    to_a * value
  end

end
