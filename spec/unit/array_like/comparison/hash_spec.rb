# https://github.com/rubyspec/rubyspec/blob/master/core/array/hash_spec.rb
describe ArrayLike::Comparison, "#hash" do
  include_context "shared subject"

  it "Returns the same fixnum for collections with the same content" do
    other = subject_class.new([0, 1, 1, 2, 3, 5, 8, 13])
    subject.hash.should eq(other.hash)
  end

  it "Returns an Integer value" do
    subject.hash.should be_an(Integer)
  end

  it "Returns the same hash value as an Array" do
    subject.hash.should eq([0, 1, 1, 2, 3, 5, 8, 13].hash)
  end

end
