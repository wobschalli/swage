# frozen_string_literal: true

require_relative "../base_generator"

module Swage::Generators
  class ControllerGenerator < BaseGenerator
    source_root File.expand_path("../scaffold/templates", __dir__)

    argument :attributes, type: :array, default: [], banner: "field:type field:type"

    hook_for :test_framework, type: :string, default: "test_unit"

    def create_controller_files
      template "controller.rb.tt", File.join("app/controllers", "#{controller_file_path}_controller.rb")
    end
  end
end
