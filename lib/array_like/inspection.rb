module ArrayLike::Inspection
  include ArrayLike::BaselineReadOnly

  def empty?(*args)
    raise NotImplementedError
  end

  def frozen?(*args)
    raise NotImplementedError
  end

  def to_s(*args)
    raise NotImplementedError
  end
  alias_method :inspect, :to_s

  alias_method :size, :length

end
