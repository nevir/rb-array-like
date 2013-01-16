describe ArrayLike::Slicable, ".new_slice" do

  let(:target_class) {
    klass = Class.new do
      include ArrayLike::Coercion
      include ArrayLike::Combinatorics
      include ArrayLike::Comparison
      include ArrayLike::Deletion
      include ArrayLike::Enumeration
      include ArrayLike::Indexing
      include ArrayLike::Insertion
      include ArrayLike::Inspection
      include ArrayLike::Modification
      include ArrayLike::SetLikeOperations
      include ArrayLike::Slicable
    end

    klass::Slice.class_eval do
      def initialize; end
    end

    klass
  }

  it "should create a new instance of the slice subclass" do
    slice = target_class.new_slice

    slice.should be_a(target_class::Slice)
  end

  it "should include choice ArrayLike modules from the container class into the slice class" do
    target_class.new_slice

    target_class::Slice.included_modules.should     include(ArrayLike::Coercion)
    target_class::Slice.included_modules.should     include(ArrayLike::Combinatorics)
    target_class::Slice.included_modules.should     include(ArrayLike::Comparison)
    target_class::Slice.included_modules.should_not include(ArrayLike::Deletion)
    target_class::Slice.included_modules.should     include(ArrayLike::Enumeration)
    target_class::Slice.included_modules.should     include(ArrayLike::Indexing)
    target_class::Slice.included_modules.should_not include(ArrayLike::Insertion)
    target_class::Slice.included_modules.should     include(ArrayLike::Inspection)
    target_class::Slice.included_modules.should_not include(ArrayLike::Modification)
    target_class::Slice.included_modules.should     include(ArrayLike::SetLikeOperations)

    target_class::Slice.const_defined?(:Slice).should_not be_true
    target_class::Slice.should_not respond_to(:new_slice)
  end

  it "should not double-initialize the slice" do
    target_class.new_slice

    target_class::Slice.should_not_receive(:include)

    target_class.new_slice
  end

  it "should not freak out w/ unnamed modules" do
    target_class.send(:include, Module.new)

    target_class.new_slice
  end

end
