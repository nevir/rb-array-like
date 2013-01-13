# https://github.com/rubyspec/rubyspec/blob/master/core/array/transpose_spec.rb
describe ArrayLike::Combinatorics, "#transpose" do
  include_context "shared subject"

  it "assumes an array of arrays and returns the result of transposing rows and columns" do
    subject.data = [[1, "a"], [2, "b"], [3, "c"]]
    subject.transpose.should eq([[1, 2, 3], ["a", "b", "c"]])
  end

  it "Raises a TypeError if the passed Argument does not respond to #to_ary" do
    expect { subject.transpose }.to raise_error(TypeError)
  end

end
