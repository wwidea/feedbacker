require File.expand_path('../lib/feedbacker/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "feedbacker"
  s.version = Feedbacker::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jonathan S. Garvin", 'Aaron Baldwin', 'WWIDEA, Inc']
  s.email = ["developers@wwidea.org"]
  s.homepage = "https://github.com/wwidea/feedbacker"
  s.summary = %q{Sitewide Feedback form pinned to sidewall as verticle tab.}
  s.description = %q{Feedbacker provides a pull out tab on the side of every page on a site for users to send feedback to the site.}
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]
end