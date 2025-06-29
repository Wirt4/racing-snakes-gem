Gem::Specification.new do |spec|
  spec.name          = 'racing_snakes_gem'
  spec.version       = RacingSnakesGem::VERSION
  spec.authors       = ['Erik Salthouse']
  spec.email         = ['erik.salthouse@gmail.com']

  spec.summary       = 'A brief summary of RacingSnakesGem.'
  spec.description   = 'A longer description of RacingSnakesGem.'
  spec.homepage      = 'https://your.project.homepage'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb'] + ['README.md', 'LICENSE.txt']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'ruby2d', '~> 0.10.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
end
