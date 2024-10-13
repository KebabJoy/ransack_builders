# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative 'lib/ransack_builders'

Gem::Specification.new do |spec|
  spec.name          = "ransack_builders"
  spec.authors       = ["Nikita Sidorov"]
  spec.email         = ["nik.prohor@gmail.com"]
  spec.license       = "MIT"
  spec.version       = RansackBuilders::VERSION.dup

  spec.summary       = "DSL for complex ransack filters builders"
  spec.description   = spec.summary
  spec.files         = Dir["README.md", "ransack_builders.gemspec", "lib/**/*"]
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["changelog_uri"]     = "https://github.com/KebabJoy/ransack_builders"
  spec.metadata["source_code_uri"]   = "https://github.com/KebabJoy/ransack_builders"

  spec.required_ruby_version = ">= 3.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
