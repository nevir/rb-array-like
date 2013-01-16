# ArrayLike::Slicable
# ===================
module ArrayLike::Slicable

  module ClassMethods
    # A slicable class gets its own subclass of [`ArrayLike::Slice`](slice.html)
    # that includes any [read-only](read_only.html) `ArrayLike` modules that are
    # included into your collection.  This allows each slice to behave very
    # closely to your overall collection.
    INHERITED_SLICE_MODULES = [
      :Coercion,
      :Combinatorics,
      :Comparison,
      :Enumeration,
      :Indexing,
      :Inspection,
      :SetLikeOperations,
    ]

    attr_accessor :slice_class_initialized

    # Constructs a new slice.
    def new_slice(*args)
      # It also lazy-initializes the `Slice` subclass with the modules that are
      # whitelisted by `INHERITED_SLICE_MODULES`.
      unless slice_class_initialized
        included_modules.each do |mod|
          if mod.name && INHERITED_SLICE_MODULES.include?(mod.name.sub(/^ArrayLike::/, "").to_sym)
            self::Slice.send(:include, mod)
          end
        end

        self.slice_class_initialized = true
      end

      self::Slice.new(*args)
    end
  end

  def self.make_slicable(klass)
    # Since we copy modules from the container class into the slice class on
    # [`new_slice`](#new_slice), we need to be careful not to have a never-
    # ending stack of `Slice` classes.
    return if klass.ancestors.include? ::ArrayLike::Slice

    # Likewise, we don't want to double-init
    if klass.const_defined? :Slice
      return if klass.const_get(:Slice).ancestors.include? ::ArrayLike::Slice

      raise ArgumentError, "Attempting to make #{klass.inspect} slicable, but it already defines #{klass.const_get(:Slice).inspect}!"
    end

    klass.const_set(:Slice, Class.new(::ArrayLike::Slice))

    klass.extend(ClassMethods)
  end

  # As an internal convenience, any `ArrayLike` module that includes this will
  # propagate it all the way out to any third party class that requires a
  # `Slice` subclass.
  def self.propagate(mod)
    return unless mod.name && mod.name.start_with?("ArrayLike::")

    if mod.respond_to? :included
      raise ArgumentError, "#{self.inspect}.propagate does not support modules that define included!"
    end

    def mod.included(other_mod)
      if other_mod.is_a? Class
        ::ArrayLike::Slicable.make_slicable(other_mod)
      else
        # Insiduous!  Propagate us until we hit a class
        ::ArrayLike::Slicable.propagate(other_mod)
      end
    end
  end

  propagate(self)

end
