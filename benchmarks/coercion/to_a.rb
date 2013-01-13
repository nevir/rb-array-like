#!/usr/bin/env ruby

require "benchmark"

class Base
  def initialize(data)
    @data = data
  end

  def each(*args, &block)
    @data.each(*args, &block)
  end

  def length
    @data.length
  end
end

class WithEnumerable < Base
  include Enumerable
end

class WithEnumerator < Base
  def to_a
    to_enum.to_a
  end
end

class Custom < Base
  def to_a
    result = []
    each do |val|
      result << val
    end

    result
  end
end

DATA_SMALL = (0...1000).to_a
DATA_MED   = (0...5000).to_a
DATA_LARGE = (0...25000).to_a

ITERATIONS = 10000

Benchmark.bmbm do |b|
  b.report("Small  (Enumerable):     ") do
    ITERATIONS.times { WithEnumerable.new(DATA_SMALL).to_a }
  end

  b.report("Small  (WithEnumerator): ") do
    ITERATIONS.times { WithEnumerator.new(DATA_SMALL).to_a }
  end

  b.report("Small  (Custom):         ") do
    ITERATIONS.times { Custom.new(DATA_SMALL).to_a }
  end

  b.report("Medium (Enumerable):     ") do
    ITERATIONS.times { WithEnumerable.new(DATA_MED).to_a }
  end

  b.report("Medium (WithEnumerator): ") do
    ITERATIONS.times { WithEnumerator.new(DATA_MED).to_a }
  end

  b.report("Medium (Custom):         ") do
    ITERATIONS.times { Custom.new(DATA_MED).to_a }
  end

  b.report("Large  (Enumerable):     ") do
    ITERATIONS.times { WithEnumerable.new(DATA_LARGE).to_a }
  end

  b.report("Large  (WithEnumerator): ") do
    ITERATIONS.times { WithEnumerator.new(DATA_LARGE).to_a }
  end

  b.report("Large  (Custom):         ") do
    ITERATIONS.times { Custom.new(DATA_LARGE).to_a }
  end
end

__END__
Rehearsal -------------------------------------------------------------
Small  (Enumerable):        0.390000   0.020000   0.410000 (  0.419549)
Small  (WithEnumerator):    0.400000   0.020000   0.420000 (  0.413934)
Small  (Custom):            0.720000   0.020000   0.740000 (  0.737232)
Medium (Enumerable):        1.840000   0.100000   1.940000 (  1.943128)
Medium (WithEnumerator):    1.850000   0.100000   1.950000 (  1.955634)
Medium (Custom):            3.480000   0.120000   3.600000 (  3.582538)
Large  (Enumerable):        9.100000   1.120000  10.220000 ( 10.227774)
Large  (WithEnumerator):    9.070000   1.080000  10.150000 ( 10.139284)
Large  (Custom):           17.600000   1.200000  18.800000 ( 18.794277)
--------------------------------------------------- total: 48.230000sec

                                user     system      total        real
Small  (Enumerable):        0.400000   0.030000   0.430000 (  0.425691)
Small  (WithEnumerator):    0.400000   0.020000   0.420000 (  0.423365)
Small  (Custom):            0.700000   0.020000   0.720000 (  0.726657)
Medium (Enumerable):        1.820000   0.100000   1.920000 (  1.914617)
Medium (WithEnumerator):    1.800000   0.100000   1.900000 (  1.906160)
Medium (Custom):            3.390000   0.100000   3.490000 (  3.483326)
Large  (Enumerable):        9.140000   1.130000  10.270000 ( 10.260726)
Large  (WithEnumerator):    9.110000   1.090000  10.200000 ( 10.198497)
Large  (Custom):           17.100000   1.100000  18.200000 ( 18.196796)
