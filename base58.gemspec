# -*- encoding: utf-8 -*-
 
Gem::Specification.new do |s|
  s.name = %q{base58}
  s.version = "0.0.3"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Douglas F Shearer"]
  s.date = %q{2009-04-25}
  s.description = %q{Base58 is a Ruby library for converting ints to and from base58.}
  s.email = %q{dougal.s@gmail.com}
  s.files = ['lib/base58.rb', 'test/test_base58.rb', 'CHANGELOG', 'MIT-LICENSE', "Rakefile", 'README.rdoc']
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dougal/base58}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = s.name
  s.rubygems_version = s.version
  s.summary = s.description
end