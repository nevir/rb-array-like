# https://github.com/rubyspec/rubyspec/blob/master/core/array/join_spec.rb
# https://github.com/rubyspec/rubyspec/blob/master/core/array/shared/join.rb
describe ArrayLike::Combinatorics, "#join" do
  include_context "shared subject"

  it "Returns an empty string if the Array is empty" do
    subject.data = []
    subject.join.should eq("")
  end

  it "Returns a string formed by concatenating each String element separated by $," do
    old = $,
    $,  = " | "
    subject.join.should eq("0 | 1 | 1 | 2 | 3 | 5 | 8 | 13")
    $, = old
  end

  it "Does not separate elements when the passed separator is nil" do
    subject.join(nil).should eq("011235813")
  end

  it "Calls #to_str to convert the separator to a String" do
    sep = Object.new
    sep.should_receive(:to_str).and_return(", ")

    subject.join(sep).should eq("0, 1, 1, 2, 3, 5, 8, 13")
  end

  it "Raises a TypeError if the separator cannot be coerced to a String by calling #to_str" do
    obj = Object.new

    expect { subject.join(obj) }.to raise_error(TypeError)
  end

end
