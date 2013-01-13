describe ArrayLike::BaselineReadOnly, "#length" do
  include_context "blank subject"

  it "should raise a helpful error if not implemented" do
    expect { subject.length }.to raise_error(NotImplementedError, /BlankSubject#length/)
  end

end
