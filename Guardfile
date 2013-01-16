# Touching any of these files should cause the entire test suite to reload.
GLOBAL_SPEC_FILES = [
  ".rspec",
  %r{^spec/.*_helper\.rb$},
  %r{^spec/common/.*\.rb$},
  "lib/array_like.rb",
]

def specs_for_path(path)
  ["spec/unit/#{path}_spec.rb", Dir["spec/unit/#{path}/**/*_spec.rb"]].flatten
end

guard "bundler" do
  watch("Gemfile")
  watch(/^.+\.gemspec/)
end

guard "spork", rspec_port: 2732 do
  watch("Gemfile")
  watch("Gemfile.lock")

  GLOBAL_SPEC_FILES.each do |pattern|
    watch(pattern) { :rspec }
  end
end

guard "rspec", cli: '--drb --drb-port 2732' do
  GLOBAL_SPEC_FILES.each do |pattern|
    watch(pattern) { "spec" }
  end

  watch(%r{^spec/.+_spec\.rb$})

  watch(%r{^spec/(.+)/shared\.rb$}) { |m| specs_for_path(m[1]) }
  watch(%r{^lib/(.+)\.rb$})         { |m| specs_for_path(m[1]) }

  # Run dependent modules, too
  watch(%r{^lib/(.+)\.rb$}) { |m|
    mod_name = m[1].split(File::SEPARATOR).map { |p| p.split("_").map(&:capitalize).join }.join("::")

    dependents = Dir["lib/array_like/**/*.rb"].select { |path|
      open(path).read.include?("include #{mod_name}")
    }

    dependents.map { |p| specs_for_path(p[%r{^lib/(.+)\.rb$}, 1]) }.flatten
  }
end
