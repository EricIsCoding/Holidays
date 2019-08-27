lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "working_days/version"

Gem::Specification.new do |spec|
  spec.name          = "working_days"
  spec.version       = WorkingDays::VERSION
  spec.authors       = ["ericiscoding"]
  spec.email         = ["ericjwilhite@gmail.com"]

  spec.summary       = "This gem is used to calculate the remaining number of working days in the calendar year."
  spec.description   = "This gem uses the Nager.Date API to calucluate the number of working days remaining. The API is used to "
  spec.homepage      = "https://github.com/EricIsCoding/working_days"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EricIsCoding/working_days"
  spec.metadata["changelog_uri"] = "https://github.com/EricIsCoding/working_days/commits/master"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
