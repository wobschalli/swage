# frozen_string_literal: true

require_relative "lib/swage"

Gem::Specification.new do |spec|
  spec.name = "swage"
  spec.version = Swage::VERSION
  spec.authors = [ "Ian Wobschall" ]
  spec.email = [ "ian.wobschall@gmail.com" ]

  spec.summary = "A Phlex UI library for Rails"
  spec.description = "A UI library gluing together RubyUI, Phlex, and Tailwind with editable generators"
  spec.homepage = "https://github.com/wobschalli/swage"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir[
    "README.md",
    "LICENSE.txt",
    "lib/**/*"
  ]

  spec.require_paths = [ "lib" ]

  spec.add_runtime_dependency "phlex-rails"
  spec.add_runtime_dependency "phlexible"
  spec.add_runtime_dependency "tailwindcss-rails"
  spec.add_runtime_dependency "superform"
  spec.add_runtime_dependency "ruby_ui"
end
