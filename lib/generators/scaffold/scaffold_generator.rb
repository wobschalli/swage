class ScaffoldGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers
  source_root File.expand_path("templates", __dir__)

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  class_option :orm, type: :string, default: "active_record"

  def create_view_files
    actions = %w[index show new edit form partial]

    actions.each do |action|
      template "#{action}.rb.tt", File.join("app/views", controller_file_path, "#{action}.rb")
    end
  end

  def create_controller_files
    template "controller.rb.tt", File.join("app/controllers", "#{controller_file_path}_controller.rb")
  end

  def create_model_files
    template "model.rb.tt", File.join("app/models", "#{file_name}.rb")
  end
end
