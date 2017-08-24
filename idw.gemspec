lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

Gem::Specification.new do |spec|
  spec.name           = 'idda-brew'
  spec.version        = '0.0.1'
  spec.summary        = 'Brew-like app management commands'
  spec.description    = 'Brew-like app management commands'
  spec.authors        = ['lyn']
  spec.email          = ['lyn@lynlab.co.kr']
  spec.license        = 'MIT'

  spec.files          = Dir.glob('{bin,lib}/**/*')
  spec.executables    = spec.files.grep(%r{^bin/}) { |f| File.basename f }
  spec.require_paths  = ['lib']
end