describe ArrayLike::BaselineReadOnly, "#each" do
  include_context "blank subject"

  it "should raise a helpful error if not implemented" do
    expect { subject.each }.to raise_error(NotImplementedError, /BlankSubject#each/)
  end

end
