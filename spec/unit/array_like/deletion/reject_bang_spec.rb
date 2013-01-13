describe ArrayLike::Deletion, "#reject!" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.reject! }.to raise_error(NotImplementedError)
  end

end
