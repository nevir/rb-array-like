module ArrayLike::Deletion
  include ArrayLike::BaselineWritable

  def clear(*args)
    raise NotImplementedError
  end

  def compact!(*args)
    raise NotImplementedError
  end

  def delete(*args)
    raise NotImplementedError
  end

  def delete_at(*args)
    raise NotImplementedError
  end

  def delete_if(*args)
    raise NotImplementedError
  end

  def keep_if(*args)
    raise NotImplementedError
  end

  def pop(*args)
    raise NotImplementedError
  end

  def reject!(*args)
    raise NotImplementedError
  end

  def select!(*args)
    raise NotImplementedError
  end

  def shift(*args)
    raise NotImplementedError
  end

  def slice!(*args)
    raise NotImplementedError
  end

end
