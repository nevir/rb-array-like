describe ArrayLike::Slicable, ".propagate" do

  it "should propagate through ArrayLike:: modules" do
    module ArrayLike::ParentTestModule; end
    ArrayLike::ParentTestModule.send(:include, subject)

    klass1 = Class.new do
      include ArrayLike::ParentTestModule
    end
    klass1.const_defined?(:Slice).should be_true
    klass1.should respond_to(:new_slice)

    module ArrayLike::ChildTestModule
      include ArrayLike::ParentTestModule
    end

    klass2 = Class.new do
      include ArrayLike::ChildTestModule
    end
    klass2.const_defined?(:Slice).should be_true
    klass2.should respond_to(:new_slice)

    ArrayLike.send(:remove_const, :ChildTestModule)
    ArrayLike.send(:remove_const, :ParentTestModule)
  end

  it "should not propagate through third party modules" do
    module ::SliceableTestModule; end
    ::SliceableTestModule.send(:include, subject)

    ::SliceableTestModule.methods.should_not include(:included)

    klass = Class.new do
      include ::SliceableTestModule
    end

    klass.const_defined?(:Slice).should_not be_true
    klass.should_not respond_to(:new_slice)

    Object.send(:remove_const, :SliceableTestModule)
  end

  it "should not freak out with unnamed modules" do
    mod = Module.new
    mod.send(:include, subject)

    mod.methods.should_not include(:included)

    klass = Class.new
    klass.send(:include, mod)

    klass.const_defined?(:Slice).should_not be_true
    klass.should_not respond_to(:new_slice)
  end

  it "should throw if the target module already defines included" do
    module ArrayLike::SliceableTestModule
      def self.included(other_mod)
        raise "I should not be called!"
      end
    end

    expect { ArrayLike::SliceableTestModule.send(:include, subject) }.to raise_error(
      ArgumentError, /included/
    )
  end

end
