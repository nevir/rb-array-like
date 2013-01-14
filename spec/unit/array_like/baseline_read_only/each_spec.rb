# https://github.com/rubyspec/rubyspec/blob/master/core/array/each_spec.rb
# https://github.com/rubyspec/rubyspec/blob/master/core/array/shared/enumeratorize.rb
describe ArrayLike::BaselineReadOnly, "#each" do
  include_context "shared subject"

  it "yields each element to the block" do
    yielded = []
    subject.each { |v| yielded << v }

    yielded.should eq([0, 1, 1, 2, 3, 5, 8, 13])
  end

  it "returns self when called with a block" do
    subject.each {}.should eq(subject)
  end

  it "yields each element to a block that takes multiple arguments" do
    other   = subject_class.new([[1, 2], 3, 4, [5, 6, 7], [8, 9]])
    yielded = []
    other.each { |x,y,z| yielded << [x, y, z] }

    yielded.should eq([
      [1, 2, nil], [3, nil, nil], [4, nil, nil], [5, 6, 7], [8, 9, nil]
    ])
  end

  it "returns an Enumerator if no block is given" do
    enum = subject.each
    enum.should be_a(Enumerator)
    enum.next.should eq(0)
    enum.next.should eq(1)
    enum.next.should eq(1)
    enum.next.should eq(2)
    enum.next.should eq(3)
    enum.next.should eq(5)
    enum.next.should eq(8)
    enum.next.should eq(13)
    expect { enum.next }.to raise_error(StopIteration)
  end

end
