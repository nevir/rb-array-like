# https://github.com/rubyspec/rubyspec/blob/master/core/array/permutation_spec.rb
describe ArrayLike::Combinatorics, "#permutation" do
  include_context "shared subject"

  it "Returns an Enumerator of all permutations when called without a block or arguments" do
    enum = subject.permutation
    enum.should be_kind_of(Enumerable)
    enum.to_a.length.should eq(40320)
  end

  it "Returns an Enumerator of permutations of given length when called with an argument but no block" do
    enum = subject.permutation(1)
    enum.should be_kind_of(Enumerable)
    enum.to_a.sort.should eq([[0], [1], [1], [2], [3], [5], [8], [13]])
  end

  it "Yields all permutations of given length to the block" do
    yielded = []
    subject.permutation(1) { |n| yielded << n }

    yielded.should eq([[0], [1], [1], [2], [3], [5], [8], [13]])
  end

end
