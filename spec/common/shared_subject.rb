shared_context "shared subject" do

  let(:subject_class) {
    klass = Class.new do
      def initialize
        @data = [0, 1, 1, 2, 3, 5, 8, 13]
      end

      attr_accessor :data

      def each(*args, &block)
        @data.each(*args, &block)
      end
    end
    klass.send :include, described_class

    # Give us a reasonable name
    Object.send(:remove_const, :SharedSubject) if Object.const_defined? :SharedSubject
    Object.const_set(:SharedSubject, klass)

    klass
  }

  subject {
    subject_class.new
  }

end
