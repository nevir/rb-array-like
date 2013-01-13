shared_context "blank subject" do

  let(:subject_class) {
    klass = Class.new do
      def initialize
        @data = [0, 1, 1, 2, 3, 5, 8, 13]
      end

      attr_accessor :data
    end
    klass.send :include, described_class

    # Give us a reasonable name
    Object.send(:remove_const, :BlankSubject) if Object.const_defined? :BlankSubject
    Object.const_set(:BlankSubject, klass)

    klass
  }

  subject {
    subject_class.new
  }

end
