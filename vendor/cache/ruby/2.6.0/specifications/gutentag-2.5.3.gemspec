# -*- encoding: utf-8 -*-
# stub: gutentag 2.5.3 ruby lib

Gem::Specification.new do |s|
  s.name = "gutentag".freeze
  s.version = "2.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Pat Allan".freeze]
  s.date = "2020-06-28"
  s.description = "A good, simple, solid tagging extension for ActiveRecord".freeze
  s.email = ["pat@freelancing-gods.com".freeze]
  s.homepage = "https://github.com/pat/gutentag".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Good Tags".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.17"])
      s.add_development_dependency(%q<combustion>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<database_cleaner>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
      s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.17"])
      s.add_dependency(%q<combustion>.freeze, ["~> 1.1"])
      s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
      s.add_dependency(%q<rubocop-performance>.freeze, ["~> 1"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.17"])
    s.add_dependency(%q<combustion>.freeze, ["~> 1.1"])
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
    s.add_dependency(%q<rubocop-performance>.freeze, ["~> 1"])
  end
end
