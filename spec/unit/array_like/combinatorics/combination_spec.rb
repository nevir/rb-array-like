# https://github.com/rubyspec/rubyspec/blob/master/core/array/combination_spec.rb
describe ArrayLike::Combinatorics, "#combination" do
  include_context "shared subject"

  it "Returns an enumerator when no block is provided" do
    subject.combination(3).should be_an(Enumerator)
  end

  it "Returns the expected combinations" do
    subject.combination(2).to_a.should eq([
      [0, 1], [0, 1], [0, 2], [0, 3], [0, 5], [0, 8], [0, 13], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [2, 3], [2, 5], [2, 8], [2, 13], [3, 5], [3, 8], [3, 13], [5, 8], [5, 13], [8, 13]
    ])
  end

  it "Returns nothing if the argument is out of bounds" do
    subject.combination(-1).to_a.should eq([])
    subject.combination(10).to_a.should eq([])
  end

  it "Yields all combinations of given length to the block" do
    yielded = []
    subject.combination(2) { |n| yielded << n }

    yielded.should eq([
      [0, 1], [0, 1], [0, 2], [0, 3], [0, 5], [0, 8], [0, 13], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [2, 3], [2, 5], [2, 8], [2, 13], [3, 5], [3, 8], [3, 13], [5, 8], [5, 13], [8, 13]
    ])
  end

end
