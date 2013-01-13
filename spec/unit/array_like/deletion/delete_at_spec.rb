describe ArrayLike::Deletion, "#delete_at" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.delete_at(3) }.to raise_error(NotImplementedError)
  end

end
