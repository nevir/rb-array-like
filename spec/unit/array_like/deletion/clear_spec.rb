describe ArrayLike::Deletion, "#clear" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.clear }.to raise_error(NotImplementedError)
  end

end
