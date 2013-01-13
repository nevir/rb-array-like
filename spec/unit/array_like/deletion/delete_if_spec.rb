describe ArrayLike::Deletion, "#delete_if" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.delete_if }.to raise_error(NotImplementedError)
  end

end
