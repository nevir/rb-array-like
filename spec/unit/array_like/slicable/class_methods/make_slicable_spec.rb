describe ArrayLike::Slicable, ".make_slicable" do

  let(:target_class) {
    klass = Class.new
    subject.make_slicable(klass)

    klass
  }

  it "should define a Slice subclass on the target class" do
    target_class.const_defined?(:Slice).should be(true)
    target_class::Slice.superclass.should eq(ArrayLike::Slice)
  end

  it "should expose new_slice on the class" do
    target_class.should respond_to(:new_slice)
  end

  it "should freak out if the class already defines a Slice constant" do
    klass = Class.new
    module klass::Slice; end

    expect { subject.make_slicable(klass) }.to raise_error(ArgumentError, /already defines/)
  end

  it "should silent-fail if the class is a Slice" do
    klass = Class.new(ArrayLike::Slice)
    subject.make_slicable(klass)

    klass.const_defined?(:Slice).should_not be_true
    klass.should_not respond_to(:new_slice)
  end

  it "should silent-fail if the class has a Slice subclass" do
    klass = Class.new
    class klass::Slice < ArrayLike::Slice; end

    subject.make_slicable(klass)

    klass.should_not respond_to(:new_slice)
  end

end
