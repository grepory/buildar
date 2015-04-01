# -*- encoding: utf-8 -*-
# vim: ft=ruby

require File.expand_path('../lib/buildar/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Greg Poirier']
  gem.email         = ['grep@gray.industries']
  gem.description   = 'Simple Packer build automation'
  gem.summary       = 'Buildar makes Packer build templates and build automation easy.'

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(/^bin\//).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  gem.name          = 'buildar'
  gem.require_paths = %w(lib)
  gem.version       = Buildar::VERSION

  # dependencies...
  gem.add_dependency('thor', '0.19.1')
  gem.add_dependency('sysexits', '1.0.2')
  gem.add_dependency('awesome_print', '~> 1.1.0')
  gem.add_dependency('abstract_type', '~> 0.0.7')
  gem.add_dependency('multi_json', '~> 1.10.1')
  gem.add_dependency('mixlib-shellout')
  gem.add_dependency('packer-config')

  # development dependencies.
  gem.add_development_dependency('rspec', '~> 3.2')
  gem.add_development_dependency('simplecov', '~> 0.9')
  gem.add_development_dependency('guard', '~> 2.12')
  gem.add_development_dependency('guard-rspec', '~> 4.5')
  gem.add_development_dependency('rubocop', '~> 0.29')
  gem.add_development_dependency('guard-rubocop', '~> 1.2')
  gem.add_development_dependency('rainbow', '2.0')
  gem.add_development_dependency('metric_fu', '~> 4.11')
  gem.add_development_dependency('rake', '~> 10.3')
  gem.add_development_dependency('yard', '~> 0.8.7')
  gem.add_development_dependency('redcarpet', '~> 3.2')
  gem.add_development_dependency('pry-nav')
end
