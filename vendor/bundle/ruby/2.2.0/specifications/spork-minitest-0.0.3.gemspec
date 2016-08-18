# -*- encoding: utf-8 -*-
# stub: spork-minitest 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "spork-minitest"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Semyon Perepelitsa"]
  s.date = "2012-04-30"
  s.email = ["sema@sema.in"]
  s.executables = ["testdrb"]
  s.files = ["bin/testdrb"]
  s.homepage = "https://github.com/semaperepelitsa/spork-minitest"
  s.rubygems_version = "2.4.6"
  s.summary = "MiniTest runner for Spork"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spork>, [">= 0"])
    else
      s.add_dependency(%q<spork>, [">= 0"])
    end
  else
    s.add_dependency(%q<spork>, [">= 0"])
  end
end
