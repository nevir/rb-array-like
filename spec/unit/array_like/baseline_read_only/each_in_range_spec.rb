describe ArrayLike::BaselineReadOnly, "#each_in_range" do
  include_context "shared subject"

  def call(*args)
    yielded = []
    subject.each_in_range(*args) { |v| yielded << v }
    yielded
  end

  it "should raise if given a negative index" do
    expect { call(-1) }.to raise_error(TypeError)
    expect { call(3, -4) }.to raise_error(TypeError)
    expect { call(-3, -2) }.to raise_error(TypeError)
  end

  it "should raise if stop_at < start_at" do
    expect { call(3, 1) }.to raise_error(TypeError)
  end

  it "should yield a single element if given the same start and stop index" do
    call(3, 3).should eq([2])
  end

  it "should yield the full unbounded set of elements if not given a stop index" do
    call(4).should eq([3, 5, 8, 13])
  end

  it "should yield the desired results" do
    call(2, 6).should eq([1, 2, 3, 5, 8])
  end

  it "should be ok if stop_at is > length" do
    call(4, 20).should eq([3, 5, 8, 13])
  end

end
