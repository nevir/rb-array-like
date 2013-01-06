#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rspec/core/rake_task"

# We want to force ourselves to review code coverage results.
task :default => :coverage

RSpec::Core::RakeTask.new(:spec) do |task|
  # No special configuration yet.
end

desc "Run the tests in CI mode"
task :ci do
  Rake::Task["spec"].execute
end

desc "Run tests with code coverage"
task :spec_with_coverage do
  prev = ENV["COVERAGE"]
  ENV["COVERAGE"] = "yes"

  Rake::Task["spec"].execute

  ENV["COVERAGE"] = prev
end

desc "Run tests with code coverage and open the results"
task :coverage => :spec_with_coverage do
  `open coverage/index.html`
end

desc "Boot up an IRB console w/ array_like preloaded"
task :console do
  require "array_like"
  require "irb"

  # IRB parses ARGV on start; let's make it think that its in its own environment
  ARGV.clear
  IRB.start
end

desc "Runs tests with code mutation"
task :mutate do
  require "array_like"
  require "mutant"

  Dir[File.expand_path("../lib/array_like/*.rb", __FILE__)].each do |path|
    require "array_like/#{File.basename(path, ".rb")}"
  end

  config = {}
  config.merge!(
    strategy: Mutant::Strategy::Rspec::DM2.new(config),
    killer:   Mutant::Killer::Rspec,
    matcher:  Mutant::Matcher::ObjectSpace.new(/\AArrayLike::/),
    filter:   Mutant::Mutation::Filter::ALL,
    reporter: Mutant::Reporter::CLI.new(config),
  )

  unless ARGV.last == "mutate"
    config[:matcher] = Mutant::Matcher.from_string("::ArrayLike::#{ARGV.pop}")
  end

  def config.method_missing(sym)
    self[sym]
  end

  exit Mutant::Runner.run(config).fail? ? 1 : 0
end
