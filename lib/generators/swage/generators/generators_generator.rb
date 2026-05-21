# frozen_string_literal: true

module Swage::Generators
  class GeneratorsGenerator < ::Rails::Generators::Base
    source_root File.expand_path __dir__

    # there's probably a better way to do this, but this should probably work well enough?
    def create_scaffold_files
      base = File.join "generators", "swage", "scaffold"

      Dir.chdir("#{source_paths.first}/../scaffold") do
        lib File.join(base, "scaffold_generator.rb"), File.open("scaffold_generator.rb", "r").read
      end

      Dir.chdir("#{source_paths.first}/../scaffold/templates") do
        Dir.glob("*.rb.tt").each do |template|
          lib File.join(base, "templates", template), File.open(template, "r").read
        end
      end
    end

    def create_install_files
      base = File.join "generators", "swage", "install"
      Dir.chdir("#{source_paths.first}/../install") do
        lib File.join(base, "install_generator.rb"), File.open("install_generator.rb", "r").read
      end

      Dir.chdir("#{source_paths.first}/../install/templates") do
        Dir.glob("*.rb.tt").each do |template|
          lib File.join(base, "templates", template), File.open(template, "r").read
        end
      end
    end

    def create_base_generator
      base = File.join "generators", "swage"
      Dir.chdir("#{source_paths.first}/..") do
        lib File.join(base, "base_generator.rb"), File.open("base_generator.rb", "r").read
      end
    end
  end
end
