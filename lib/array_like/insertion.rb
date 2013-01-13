# ArrayLike::Insertion
# ====================
module ArrayLike::Insertion
  include ArrayLike::BaselineWritable

  def <<(obj)
    raise NotImplementedError
  end

  def []=(obj)
    raise NotImplementedError
  end

  def concat(*args)
    raise NotImplementedError
  end

  def insert(*args)
    raise NotImplementedError
  end

  def push(*args)
    raise NotImplementedError
  end

  def unshift(*args)
    raise NotImplementedError
  end

end
