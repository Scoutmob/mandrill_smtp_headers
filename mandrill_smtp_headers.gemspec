# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mandrill_smtp_headers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Calvin Yu"]
  gem.email         = ["calvin@scoutmob.com"]
  gem.description   = %q{Provides convenience methods for setting Mandrill SMTP headers for ActionMailer}
  gem.summary       = %q{Provides convenience methods for setting Mandrill SMTP headers for ActionMailer}
  gem.homepage      = "http://github.com/Scoutmob/mandrill_smtp_headers"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mandrill_smtp_headers"
  gem.require_paths = ["lib"]
  gem.version       = MandrillSmtpHeaders::VERSION

  gem.add_dependency 'rails', '>= 3.0'
  gem.add_dependency 'multi_json', '~> 1.0'
end
