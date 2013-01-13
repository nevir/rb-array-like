describe ArrayLike::Inspection, "#empty?" do
  include_context "shared subject"

  it "Returns true if the collection is empty?" do
    subject_class.new([]).should be_empty
    subject.should_not be_empty
  end

end
