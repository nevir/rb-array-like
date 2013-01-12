describe ArrayLike::Enumeration, "#to_ary" do
  include_context "shared subject"

  it "should coerce to an array" do
    subject.to_ary.should eq([0, 1, 1, 2, 3, 5, 8, 13])
  end

end
