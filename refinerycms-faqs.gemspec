Gem::Specification.new do |s|
  s.authors           = ["A.K.M. Ashrafuzzaman", "Pete Higgins"]
  s.email             = ["ashrafuzzaman.g2@gmail.com", "pete@substantial.com"]

  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-faqs'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Faqs engine for Refinery CMS'
  s.date              = '2011-11-04'
  s.summary           = 'Faqs engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  s.add_development_dependency 'refinerycms-testing', '~> 2.0.0'
end
