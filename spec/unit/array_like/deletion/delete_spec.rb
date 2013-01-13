describe ArrayLike::Deletion, "#delete" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.delete }.to raise_error(NotImplementedError)
  end

end
