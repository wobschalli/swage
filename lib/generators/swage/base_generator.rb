# frozen_string_literal: true

module Swage::Generators
  class BaseGenerator < ::Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers
    def self.set_source_root(file_name, dir)
      if File.exist?(Rails.root.join("lib/generators/swage", file_name))
        source_root Rails.root.join("lib/generators/swage/templates")
      else
        source_root File.expand_path("templates", dir)
      end
    end
  end
end
