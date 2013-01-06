describe ArrayLike::SetOperations, "#&" do
  include_context "shared subject"

  it "intersects other arrays" do
    (subject & []).should eq([])
    (subject & [1, 3, 9]).should eq([1, 3])
  end

  it "can be intersected by an array" do
    ([1, 1, 2, 3] & subject).should eq([1,2,3])
  end

end
