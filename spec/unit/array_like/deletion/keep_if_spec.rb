describe ArrayLike::Deletion, "#keep_if" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.keep_if }.to raise_error(NotImplementedError)
  end

end
