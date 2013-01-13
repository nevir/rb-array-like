describe ArrayLike::Inspection, "#inspect" do
  include_context "shared subject"

  it "Describes the subject's class" do
    subject.inspect.should include(subject.class.name)
  end

  it "Contains the subject's contents" do
    subject.inspect.should include("[0, 1, 1, 2, 3, 5, 8, 13]")
  end

end
