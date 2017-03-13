# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wordpress/wxr/version'

Gem::Specification.new do |spec|
  spec.name          = 'wordpress-wxr'
  spec.version       = Wordpress::WXR::VERSION
  spec.authors       = ['ePublishing, inc.']
  spec.email         = ['development@ePublishing.com']

  spec.summary       = 'Parse a WordPress XML file into separate Ruby objects.'
  spec.homepage      = 'https://bitbucket.org/epub_dev/wordpress-wxr'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'email_address', '~> 0.1.3'
  spec.add_runtime_dependency 'nokogiri'
end
