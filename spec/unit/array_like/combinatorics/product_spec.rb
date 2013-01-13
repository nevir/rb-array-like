# https://github.com/rubyspec/rubyspec/blob/master/core/array/product_spec.rb
describe ArrayLike::Combinatorics, "#product" do
  include_context "shared subject"

  it "Returns the expected result" do
    subject.product([1,2]).should eq([
      [0, 1], [0, 2], [1, 1], [1, 2], [1, 1], [1, 2], [2, 1], [2, 2], [3, 1], [3, 2], [5, 1], [5, 2], [8, 1], [8, 2], [13, 1], [13, 2]
    ])
  end

  it "Has no required argument" do
    subject.product.should eq([[0], [1], [1], [2], [3], [5], [8], [13]])
  end

  it "Yields all combinations in turn" do
    yielded = []
    subject.product([1,2]) { |i| yielded << i }

    yielded.should eq([
      [0, 1], [0, 2], [1, 1], [1, 2], [1, 1], [1, 2], [2, 1], [2, 2], [3, 1], [3, 2], [5, 1], [5, 2], [8, 1], [8, 2], [13, 1], [13, 2]
    ])
  end

end
