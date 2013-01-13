# ArrayLike::Modification
# =======================
module ArrayLike::Modification
  include ArrayLike::BaselineWritable

  def collect!(*args)
    raise NotImplementedError
  end
  alias_method :map!, :collect!

  def fill(*args)
    raise NotImplementedError
  end

  def flatten!(*args)
    raise NotImplementedError
  end

  def replace(*args)
    raise NotImplementedError
  end

  def reverse!(*args)
    raise NotImplementedError
  end

  def rotate!(*args)
    raise NotImplementedError
  end

  def shuffle!(*args)
    raise NotImplementedError
  end

  def sort!(*args)
    raise NotImplementedError
  end

  def sort_by!(*args)
    raise NotImplementedError
  end

  def uniq!(*args)
    raise NotImplementedError
  end

end
