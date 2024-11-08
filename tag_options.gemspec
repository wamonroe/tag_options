require_relative "lib/tag_options/version"

Gem::Specification.new do |spec|
  spec.name = "tag_options"
  spec.version = TagOptions::VERSION
  spec.authors = ["Alex Monroe"]
  spec.email = ["alex@monroepost.com"]

  spec.summary = "Simple library for manipulating options passed to various Rails tag helpers."
  spec.description = spec.summary
  spec.homepage = "https://github.com/wamonroe/tag_options"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/wamonroe/tag_options/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "CHANGELOG.md", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "activesupport"
end
