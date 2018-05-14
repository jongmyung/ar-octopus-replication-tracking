# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'octopus/replication_tracking/version'

Gem::Specification.new do |s|
  s.name        = 'ar-octopus-replication-tracking'
  s.version     = Octopus::ReplicationTracking::VERSION
  s.authors     = ['Jongmyung Ha']
  s.email       = ['jongmyung@stayntouch.com']
  s.homepage    = 'https://github.com/jongmyung/octopus-replication-tracking'
  s.summary     = 'Check master/slave replication position with Octopus'
  s.description = 'This gem allows you to find replication position with Octopus'

  # s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency 'ar-octopus', '>= 0.8.6'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '>= 3'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'pry-byebug'

  s.license = 'MIT'
end
