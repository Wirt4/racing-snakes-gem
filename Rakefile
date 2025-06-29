require 'rake'
require 'rspec/core/rake_task'

# ----- Run RSpec tests -----
desc 'Run all specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task default: :spec

# ----- Build the gem -----
desc 'Build the gem into a .gem file'
task :build do
  sh 'gem build racing_snakes_gem.gemspec'
end

# ----- Install the gem locally -----
desc 'Build and install the gem'
task install: :build do
  gem_file = Dir['racing_snakes_gem-*.gem'].sort.last
  sh "gem install ./#{gem_file}"
end

# ----- Clean generated .gem files -----
desc 'Remove generated .gem files'
task :clean do
  rm_f Dir['*.gem']
end
