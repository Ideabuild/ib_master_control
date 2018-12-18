# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'master_control/version'

Gem::Specification.new do |spec|
  spec.name          = "master_control"
  spec.version       = MasterControl::VERSION
  spec.authors       = ["Ideabuild"]
  spec.email         = ["support@ideabuild.com"]

  spec.summary       = %q{Shared code for Ideabuild applications}
  spec.description   = %q{Shared code for Ideabuild applications}
  spec.homepage      = "https://github.com/ideabuild/ib_master_control"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.test_files    = Dir["spec/**/*"]

  spec.add_dependency "activejob", "~> 5.2.2"
  spec.add_dependency "active_model_serializers", "~> 0.10.4"
  spec.add_dependency "activesupport", "~> 5.2.2"
  spec.add_dependency "connection_pool", "~> 2.2.1"
  spec.add_dependency "json-schema", "~> 2.7.0"
  spec.add_dependency "jwt", "~> 2.1"
  spec.add_dependency "sneakers", "~> 2.4.0"

  spec.add_development_dependency "bump", "~> 0.5.3"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "byebug", "~> 9.0.6"
  spec.add_development_dependency "faker", "~> 1.7.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails", "~> 3.5.2"
  spec.add_development_dependency "rubocop", "= 0.42.0"
  spec.add_development_dependency "shoulda-matchers", "= 3.1.1"
end
