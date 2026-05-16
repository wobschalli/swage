# frozen_string_literal: true

require_relative "../base_generator"

module Swage::Generators
  class ScaffoldGenerator < BaseGenerator
    source_root File.expand_path("templates", __dir__)

    argument :attributes, type: :array, default: [], banner: "field:type field:type"

    class_option :orm, type: :string, default: "active_record"

    # add json templates as necessary

    def create_view_files
      actions = %w[index show new edit form partial]

      actions.each do |action|
        template "#{action}.rb.tt", File.join("app/views", controller_file_path, "#{action}.rb")
      end
    end

    def create_controller_files
      template "controller.rb.tt", File.join("app/controllers", "#{controller_file_path}_controller.rb")
    end
  end
end
