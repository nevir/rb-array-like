# https://github.com/rubyspec/rubyspec/blob/master/core/array/eql_spec.rb
describe ArrayLike::Comparison, "#eql?" do
  include_context "shared subject"

  it "Returns false if any corresponding elements are not #eql?" do
    other = subject_class.new([0, 1, 1, 2, 3.0, 5, 8, 13])
    subject.should_not be_eql(other)
  end

  it "Returns true if corresponding elements are #eql?" do
    other = subject_class.new([0, 1, 1, 2, 3, 5, 8, 13])
    subject.should be_eql(other)
  end

  it "Can be eql? to an Array" do
    subject.should be_eql([0, 1, 1, 2, 3, 5, 8, 13])
  end

  it "Should not bother coercing the subject to_a if it is the same object" do
    subject.should_not_receive(:to_a)
    subject.should be_eql(subject)
  end

  it "Should not bother coercing the subject to_a if the lengths do not match" do
    subject.should_not_receive(:to_a)
    subject.should_not be_eql([0, 1, 1, 2, 3, 5, 13])
  end

end
