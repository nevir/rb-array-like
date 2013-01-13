describe ArrayLike::Combinatorics, "#*" do
  include_context "shared subject"

  it "Concatenates when given a String" do
    (subject * "::").should eq("0::1::1::2::3::5::8::13")
  end

  it "Duplicates the array when given an Integer" do
    (subject * 2).should eq([0, 1, 1, 2, 3, 5, 8, 13, 0, 1, 1, 2, 3, 5, 8, 13])
  end

  it "Should not bother coercing the subject to_a if given a string" do
    subject.should_not_receive(:to_a)
    (subject * "::").should eq("0::1::1::2::3::5::8::13")
  end

end
