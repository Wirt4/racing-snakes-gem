Gem::Specification.new do |spec|
  spec.name          = 'racing_snakes_gem'
  spec.version       = '0.1.0'
  spec.authors       = ['Erik Salthouse']
  spec.email         = ['erik.salthouse@gmail.com']

  spec.summary       = 'A Ruby2D-based snake game for two players'
  spec.description   = 'RacingSnakes is a two-player competitive snake game built with Ruby2D, packaged as a gem for reuse and extension.'
  spec.homepage      = 'https://github.com/yourusername/racing_snakes_gem'
  spec.license       = 'MIT'

  # Directories
  spec.files         = Dir.glob('lib/**/*.rb') +
                       %w[README.md LICENSE.txt]
  spec.require_paths = ['lib']

  # Runtime dependencies
  spec.add_runtime_dependency 'ruby2d', '>= 0.10', '< 1.0'

  # Development dependencies (optional)
  spec.add_development_dependency 'rspec', '~> 3.12'

  # If you later add a CLI launcher, uncomment these:
  # spec.bindir        = "exe"
  # spec.executables   = ["racing_snakes"]

  # Metadata (optional but recommended for RubyGems.org)
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
end
