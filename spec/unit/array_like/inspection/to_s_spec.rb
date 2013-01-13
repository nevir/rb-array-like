describe ArrayLike::Inspection, "#to_s" do
  include_context "shared subject"

  it "Returns the Array representation for the subject's data" do
    subject.to_s.should eq("[0, 1, 1, 2, 3, 5, 8, 13]")
  end

end
