$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'blog'
  s.version     = Blog::VERSION
  s.authors     = ['Marco Damaceno']
  s.email       = ['maadamaceno@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Blog.'
  s.description = 'TODO: Description of Blog.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.5'
  s.add_dependency 'active_model_serializers'
  s.add_dependency 'friendly_id', '~> 5.1.0'

  s.add_development_dependency 'pg'
end
