describe ArrayLike::Deletion, "#pop" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.pop }.to raise_error(NotImplementedError)
  end

end
