describe ArrayLike::Coercion, "#entries" do
  include_context "shared subject"

  it "should coerce to an array" do
    subject.entries.should be_a(Array)
    subject.entries.should eq([0, 1, 1, 2, 3, 5, 8, 13])
  end

end
