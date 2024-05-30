# frozen_string_literal: true

require_relative "lib/picfisher/version"

Gem::Specification.new do |spec|
  spec.name = "picfisher"
  spec.version = PicFisher::VERSION
  spec.authors = ["Fernando Guillen"]
  spec.email = ["fguillen.mail@gmail.com"]

  spec.summary = "Command line tool to download images from a text file."
  spec.description = "Reading all the image URLs from a given text file and download them to a given directory."
  spec.homepage = "https://github.com/fguillen/PicFisher"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/fguillen/PicFisher/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ exe/ .git .github appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables << "picfisher"
  spec.require_paths = ["lib"]

  spec.add_dependency "minitest", "~> 5.16"
  spec.add_dependency "open-uri", "~> 0.4.1"
  spec.add_dependency "uri", "~> 0.13.0"

  spec.add_development_dependency "mocha", "~> 2.3"
  spec.add_development_dependency "webmock", "~> 3.23", ">= 3.23.1"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "rake", "~> 13.0"

  spec.metadata["rubygems_mfa_required"] = "false"
end
