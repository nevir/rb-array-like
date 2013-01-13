shared_context "shared subject" do

  let(:subject_class) {
    klass = Class.new do
      def initialize(data)
        @data = data
      end

      attr_accessor :data

      # BaselineReadOnly, BaselineWritable
      [:at, :each, :length].each do |sym|
        class_eval <<-end_eval, __FILE__, __LINE__
          def #{sym}(*args, &block)
            @data.#{sym}(*args, &block)
          end
        end_eval
      end

    end
    klass.send :include, described_class

    # Give us a reasonable name
    Object.send(:remove_const, :SharedSubject) if Object.const_defined? :SharedSubject
    Object.const_set(:SharedSubject, klass)

    klass
  }

  subject {
    subject_class.new([0, 1, 1, 2, 3, 5, 8, 13])
  }

end
