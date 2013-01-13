# ArrayLike::Coercion
# ===================
module ArrayLike::Coercion
  include ArrayLike::BaselineReadOnly

  # to_a
  # ----

  # Returns an array containing the items in `self`.
  def to_a
    # Manually implementing `to_a` ourselves is [considerably slower than using
    # `Enumerable`'s implementation](https://gist.github.com/4522295),
    # presumably due to GC and dispatch overhead.
    #
    # This provides us with the same performance characteristics, but without
    # forcing `Enumerable` to be included if you don't wish it
    Enumerator.new(self).to_a
  end
  alias_method :entries, :to_a

  # to_ary
  # ------

  # Ideally, returns an object that behaves enough like an array that it does
  # not need to be coerced for the caller.
  #
  # However, Too many other functions make the assumption that this returns an
  # explicit `Array`; it doesn't look like we can take advantage of implicit
  # coercion.
  #
  # http://bugs.ruby-lang.org/issues/7657 for example.
  alias_method :to_ary, :to_a

end
