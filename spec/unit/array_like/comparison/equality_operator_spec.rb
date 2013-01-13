# https://github.com/rubyspec/rubyspec/blob/master/core/array/equal_value_spec.rb
describe ArrayLike::Comparison, "#==" do
  include_context "shared subject"

  it "returns false if any corresponding elements are not #==" do
    other = subject_class.new([0, 1, 1, 2, 4, 5, 8, 13])
    subject.should_not eq(other)
  end

  it "returns true if corresponding elements are #==" do
    other = subject_class.new([0.0, 1.0, 1.0, 2.0, 3.0, 5.0, 8.0, 13.0])
    subject.should eq(other)
  end

end
