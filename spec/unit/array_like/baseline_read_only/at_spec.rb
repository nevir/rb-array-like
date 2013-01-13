describe ArrayLike::BaselineReadOnly, "#at" do
  include_context "blank subject"

  it "should raise a helpful error if not implemented" do
    expect { subject.at(5) }.to raise_error(NotImplementedError, /BlankSubject#at/)
  end

end
