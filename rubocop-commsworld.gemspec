require_relative "lib/rubocop/commsworld/version"

Gem::Specification.new do |spec|
  spec.name          = "rubocop-commsworld"
  spec.version       = RuboCop::Commsworld::VERSION
  spec.authors       = ["Lewis Eason"]
  spec.email         = ["lewis.eason@commsworld.com"]

  spec.summary       = "Commsworld rubocop config and cops"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(/^(test|spec|features)\//) }
  end

  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rubocop", "~> 1.8.1"
  spec.add_runtime_dependency "rubocop-rails"
  spec.add_runtime_dependency "rubocop-rspec"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rspec"
end
