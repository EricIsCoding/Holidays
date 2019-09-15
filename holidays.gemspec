lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "holidays/version"

Gem::Specification.new do |spec|
  spec.name          = "holidays"
  spec.version       = Holidays::VERSION
  spec.authors       = ["ericiscoding"]
  spec.email         = ["ericjwilhite@gmail.com"]

  spec.summary       = %q{This gem is used to list the holidays remaining in the year.}
  spec.description   = %q{This gem uses the Date.Nager.At API to pull lists of holidays and display detail about the holidays listed.}
  spec.homepage      = "https://github.com/EricIsCoding/holidays"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EricIsCoding/holidays"
  spec.metadata["changelog_uri"] = "https://github.com/EricIsCoding/holidays/commits/master"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files`.split($\)
  spec.bindir        = "bin"
  spec.executables   = "holidays"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "require_all", "~> 2.0.0"
  # spec.add_dependency "activesupport", "~> 4.2.2"
  spec.add_dependency "httparty", "~> 0.17.0"
end
