lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/dnanexus/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-dnanexus"
  spec.version = OmniAuth::DNAnexus::VERSION
  spec.authors = ["Mike Rogers"]
  spec.email = ["me@mikerogers.io"]

  spec.summary = "OmniAuth strategy for DNAnexus"
  spec.description = "OmniAuth strategy for DNAnexus"
  spec.homepage = "https://github.com/MikeRogers0/omniauth-dnanexus"
  spec.license = "MIT"

  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2"
  spec.add_dependency "jwt"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "webmock", "~> 3.8"
  spec.add_development_dependency "simplecov", "~> 0.18"
  spec.add_development_dependency "standard", "~> 1.1"
end
