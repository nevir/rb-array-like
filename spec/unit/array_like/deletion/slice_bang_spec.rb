describe ArrayLike::Deletion, "#slice!" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.slice! }.to raise_error(NotImplementedError)
  end

end
