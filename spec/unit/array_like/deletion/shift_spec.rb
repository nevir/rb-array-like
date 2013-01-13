describe ArrayLike::Deletion, "#shift" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.shift }.to raise_error(NotImplementedError)
  end

end
