# frozen_string_literal: true

module Swage::Generators
  class GeneratorsGenerator < ::Rails::Generators::Base
    source_root File.expand_path __dir__

    # there's probably a better way to do this, but this should probably work well enough?
    def create_scaffold_files
      base = File.join "generators", "swage", "scaffold"
      # binding.irb
      Dir.chdir("#{source_paths.first}/../scaffold") do
        lib base, File.open("scaffold_generator.rb", "r").read

        Dir.chdir("templates")
        Dir.glob("*.rb.tt").each do |template|
          # binding.irb
          lib File.join(base, "templates", template), File.open(template, "r").read
        end
      end
    end

    def create_install_files
      base = File.join "generators", "swage", "install"
      Dir.chdir("#{source_paths.first}/../install") do
        lib base, File.open("install_generator.rb", "r").read

        Dir.chdir("templates")
        Dir.glob("*.rb.tt").each do |template|
          lib File.join(base, "templates", template), File.open(template, "r").read
        end
      end
    end
  end
end
