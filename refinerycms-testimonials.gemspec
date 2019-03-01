# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-testimonials'
  s.version           = '4.0.0'
  s.description       = 'Ruby on Rails Testimonials extension for Refinery CMS'
  s.date              = '2019-02-16'
  s.summary           = 'Testimonials extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = 'tsdbrown - Luke Brown- magpieuk, Lee Irving - http://www.transcendit.co.uk, anita - Anita Graham - http//:www.joli.com.au'

  # Runtime dependencies
  s.add_dependency    'refinerycms', '>=4.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing'
end
