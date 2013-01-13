describe ArrayLike::Inspection, "#size" do
  include_context "shared subject"

  it "Returns the number of elements in the collection" do
    subject.size.should eq(8)
    subject_class.new([]).size.should eq(0)
  end

end
