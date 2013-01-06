module ArrayLike; end
module ArrayLike::Coercion
  include Enumerable

  # Too many other functions make the assumption that this returns an explicit
  # `Array`; it doesn't look like we can take advantage of implicit coercion.
  alias_method :to_ary, :to_a

end
