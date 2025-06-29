Gem::Specification.new do |spec|
  spec.name          = 'racing_snakes_gem'
  spec.version       = '0.1.0'
  spec.authors       = ['Erik Salthouse']
  spec.email         = ['erik.salthouse@gmail.com']

  spec.summary       = 'A Ruby2D-based snake game for two players'
  spec.description   = 'RacingSnakes is a two-player competitive snake game built with Ruby2D, packaged as a gem for reuse and extension.'
  spec.homepage      = 'https://github.com/Wirt4/racing-snakes-gem'
  spec.license       = 'MIT'

  # Directories
  spec.files         = Dir.glob('lib/**/*.rb') +
                       %w[exe/racing_snakes README.md LICENSE.txt]
  spec.require_paths = ['lib']

  # Runtime dependencies
  spec.add_runtime_dependency 'ruby2d', '>= 0.10', '< 1.0'

  # Development dependencies (optional)
  spec.add_development_dependency 'rspec', '~> 3.12'

  # If you later add a CLI launcher, uncomment these:
  spec.bindir        = 'exe'
  spec.executables   = ['racing_snakes']
end
