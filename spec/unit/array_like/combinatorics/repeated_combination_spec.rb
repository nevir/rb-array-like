# https://github.com/rubyspec/rubyspec/blob/master/core/array/repeated_combination_spec.rb
describe ArrayLike::Combinatorics, "#repeated_combination" do
  include_context "shared subject"

  it "Returns the expected repeated_combinations" do
    subject.repeated_combination(2).to_a.should eq([
      [0, 0], [0, 1], [0, 1], [0, 2], [0, 3], [0, 5], [0, 8], [0, 13], [1, 1], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [2, 2], [2, 3], [2, 5], [2, 8], [2, 13], [3, 3], [3, 5], [3, 8], [3, 13], [5, 5], [5, 8], [5, 13], [8, 8], [8, 13], [13, 13]
    ])
  end

  it "Returns [] when length is 0" do
    subject.repeated_combination(0).to_a.should eq([[]])
  end

  it "Yields all repeated_combinations of given length to the block" do
    yielded = []
    subject.repeated_combination(2) { |n| yielded << n }

    yielded.should eq([
      [0, 0], [0, 1], [0, 1], [0, 2], [0, 3], [0, 5], [0, 8], [0, 13], [1, 1], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [1, 1], [1, 2], [1, 3], [1, 5], [1, 8], [1, 13], [2, 2], [2, 3], [2, 5], [2, 8], [2, 13], [3, 3], [3, 5], [3, 8], [3, 13], [5, 5], [5, 8], [5, 13], [8, 8], [8, 13], [13, 13]
    ])
  end

end
