# https://github.com/rubyspec/rubyspec/blob/master/core/array/comparison_spec.rb
describe ArrayLike::Comparison, "#<=>" do
  include_context "shared subject"

  it "Returns 0 if the collections are equal" do
    identical = subject_class.new([0, 1, 1, 2, 3, 5, 8, 13])
    (subject <=> identical).should eq(0)
  end

  it "Returns -1 if the collection is shorter than the other collection" do
    longer = subject_class.new([0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
    (subject <=> longer).should eq(-1)
  end

  it "Returns +1 if the collection is longer than the other collection" do
    shorter = subject_class.new([0, 1, 1, 2, 3, 5])
    (subject <=> shorter).should eq(1)
  end

  it "Can compare with Arrays" do
    (subject <=> [0, 1, 1, 2, 3, 5, 8, 13]).should eq(0)
    (subject <=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]).should eq(-1)
    (subject <=> [0, 1, 1, 2, 3, 5]).should eq(1)
  end

end
