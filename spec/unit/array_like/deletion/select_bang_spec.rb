describe ArrayLike::Deletion, "#select!" do
  include_context "shared subject"

  it "should not be implemented yet" do
    expect { subject.select! }.to raise_error(NotImplementedError)
  end

end
