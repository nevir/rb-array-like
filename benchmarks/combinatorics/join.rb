#!/usr/bin/env ruby

require "benchmark"

class Tester
  include Enumerable

  SEPARATOR = ", "

  def initialize(data)
    @data = data
  end

  def each(*args, &block)
    @data.each(*args, &block)
  end

  def array_join
    to_a.join(SEPARATOR)
  end

  def each_join
    result = ""
    first  = true

    i     = 0
    max_i = @data.length - 1
    each do |val|
      result << val.to_s

      result << SEPARATOR if i < max_i
      i += 1
    end

    result
  end

  def map_join
    Enumerator.new(self).map(&:to_s).join(SEPARATOR)
  end
end

SAMPLES = {
  ints_small: (0...1000).to_a,
  ints_med:   (0...5000).to_a,
  ints_large: (0...25000).to_a,
  strs_small: (0...1000).map(&:to_s),
  strs_med:   (0...5000).map(&:to_s),
  strs_large: (0...25000).map(&:to_s),
}

Benchmark.bmbm do |b|
  SAMPLES.each do |sample_name, sample|
    [:array_join, :each_join, :map_join].each do |impl|
      b.report("%-10s   %-10s" % [sample_name, impl]) do
        1000.times { Tester.new(sample).send(impl) }
      end
    end
  end
end

__END__
Rehearsal -----------------------------------------------------------
ints_small   array_join   0.310000   0.000000   0.310000 (  0.307796)
ints_small   each_join    0.310000   0.000000   0.310000 (  0.308139)
ints_small   map_join     0.240000   0.000000   0.240000 (  0.243604)
ints_med     array_join   1.570000   0.000000   1.570000 (  1.568326)
ints_med     each_join    1.570000   0.000000   1.570000 (  1.568250)
ints_med     map_join     1.260000   0.000000   1.260000 (  1.258811)
ints_large   array_join   8.200000   0.230000   8.430000 (  8.424906)
ints_large   each_join    8.050000   0.010000   8.060000 (  8.058255)
ints_large   map_join     6.720000   0.000000   6.720000 (  6.734052)
strs_small   array_join   0.110000   0.010000   0.120000 (  0.112897)
strs_small   each_join    0.250000   0.000000   0.250000 (  0.250314)
strs_small   map_join     0.180000   0.000000   0.180000 (  0.182338)
strs_med     array_join   0.510000   0.020000   0.530000 (  0.524085)
strs_med     each_join    1.200000   0.010000   1.210000 (  1.210764)
strs_med     map_join     0.880000   0.010000   0.890000 (  0.887476)
strs_large   array_join   2.570000   0.120000   2.690000 (  2.687686)
strs_large   each_join    5.980000   0.050000   6.030000 (  6.036939)
strs_large   map_join     4.400000   0.120000   4.520000 (  4.513729)
------------------------------------------------- total: 44.890000sec

                              user     system      total        real
ints_small   array_join   0.320000   0.000000   0.320000 (  0.314269)
ints_small   each_join    0.320000   0.000000   0.320000 (  0.318236)
ints_small   map_join     0.250000   0.000000   0.250000 (  0.252189)
ints_med     array_join   1.590000   0.000000   1.590000 (  1.591552)
ints_med     each_join    1.610000   0.000000   1.610000 (  1.613786)
ints_med     map_join     1.250000   0.000000   1.250000 (  1.249786)
ints_large   array_join   8.150000   0.010000   8.160000 (  8.143065)
ints_large   each_join    8.200000   0.000000   8.200000 (  8.194922)
ints_large   map_join     6.710000   0.010000   6.720000 (  6.722075)
strs_small   array_join   0.110000   0.000000   0.110000 (  0.108811)
strs_small   each_join    0.250000   0.000000   0.250000 (  0.246266)
strs_small   map_join     0.180000   0.000000   0.180000 (  0.181034)
strs_med     array_join   0.510000   0.010000   0.520000 (  0.525497)
strs_med     each_join    1.200000   0.010000   1.210000 (  1.215260)
strs_med     map_join     0.880000   0.010000   0.890000 (  0.892705)
strs_large   array_join   2.580000   0.120000   2.700000 (  2.693316)
strs_large   each_join    6.150000   0.060000   6.210000 (  6.198494)
strs_large   map_join     4.390000   0.120000   4.510000 (  4.502196)
