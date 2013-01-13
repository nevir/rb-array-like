# https://github.com/rubyspec/rubyspec/blob/master/core/array/repeated_permutation_spec.rb
describe ArrayLike::Combinatorics, "#repeated_permutation" do
  include_context "shared subject"

  it "Yields the expected repeated_permutations" do
    subject.repeated_permutation(2).to_a.should eq([
      [0, 0], [0, 1], [0, 1], [0, 2], [0, 3], [0, 5], [0, 8], [0, 13], [1, 0], [1, 1], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [1, 0], [1, 1], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [2, 0], [2, 1], [2, 1], [2, 2], [2, 3], [2, 5], [2, 8], [2, 13], [3, 0], [3, 1], [3, 1], [3, 2], [3, 3], [3, 5], [3, 8], [3, 13], [5, 0], [5, 1], [5, 1], [5, 2], [5, 3], [5, 5], [5, 8], [5, 13], [8, 0], [8, 1], [8, 1], [8, 2], [8, 3], [8, 5], [8, 8], [8, 13], [13, 0], [13, 1], [13, 1], [13, 2], [13, 3], [13, 5], [13, 8], [13, 13]
    ])
  end

  it "Yields [] when length is 0" do
    subject.repeated_permutation(0).to_a.should eq([[]])
  end

  it "Yields all repeated_permutations of given length to the block" do
    yielded = []
    subject.repeated_permutation(2) { |n| yielded << n }

    yielded.should eq([
      [0, 0], [0, 1], [0, 1], [0, 2], [0, 3], [0, 5], [0, 8], [0, 13], [1, 0], [1, 1], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [1, 0], [1, 1], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [2, 0], [2, 1], [2, 1], [2, 2], [2, 3], [2, 5], [2, 8], [2, 13], [3, 0], [3, 1], [3, 1], [3, 2], [3, 3], [3, 5], [3, 8], [3, 13], [5, 0], [5, 1], [5, 1], [5, 2], [5, 3], [5, 5], [5, 8], [5, 13], [8, 0], [8, 1], [8, 1], [8, 2], [8, 3], [8, 5], [8, 8], [8, 13], [13, 0], [13, 1], [13, 1], [13, 2], [13, 3], [13, 5], [13, 8], [13, 13]
    ])
  end

end
