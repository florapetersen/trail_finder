require_relative 'lib/trail_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "trail_finder"
  spec.version       = TrailFinder::VERSION
  spec.authors       = ["florapetersen"]
  spec.email         = ["floramarina@comcast.net"]

  spec.summary       = %q{TrailFinder gem.}
  spec.description   = %q{Provides a CLI you can run to get information about local mountain biking trails from the Trails API.}
  spec.homepage      = "https://github.com/florapetersen/trail_finder"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/florapetersen/trail_finder"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = ["trailfinder_cli"]
  spec.require_paths = ["lib"]


end
