# frozen_string_literal: true

module Swage::Generators
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    class_option :engine, type: :boolean, default: false
    class_option :override, type: :boolean, default: false

    @name = nil

    def check_for_engine
      @engine = options["engine"] # set use instance variables because they look nicer

      if probably_engine? && !@engine
        if yes?("This appears to be an engine. do you wish to insatll swage as such?")
          say "Installing in engine mode. Hint: use `rails g swage:install --engine`"
          @engine = true
        end
      end
    end

    def check_for_override
      if @engine
        @override = options["override"]
      else
        @override = true
      end
    end


    def check_for_js
      return if @engine # engines don't have their own js ecosystem
      unless using_importmap? || using_bun? || using_yarn? || using_npm? || using_pnpm?
        if yes?("No javascript package manager was detected. Do you wish to exit now, or continue and install missing requirements manually?")
          exit 0
        end
      end
    end

    def add_dependencies
      deps = %W[ tailwindcss-rails phlex-rails phlexible superform ruby_ui ]
      missing = []
      deps.each do |d|
        unless Gem.loaded_specs.has_key?(d)
          say "missing #{d} in gemfile"
          missing << d
        end
      end

      if missing.any?
        return if @engine && missing.length == 1 && missing[0] == "ruby_ui"
        if yes?("would you like to automatically install the missing dependencies?")
          add_source "https://rubygems.org" do
            deps.each do |d|
              gem d
            end
          end
        else
          exit 1
        end
      end
    end

    def install_tailwind
      if !@engine || (@engine && @override)
        say "install tailwind"
        execute_command "rake", "tailwindcss:install"
      end
    end

    def install_phlex
      return if @engine
      say "install phlex"
      generate "phlex:install"
    end

    def install_superform
      return if @engine
      say "install superform"
      generate "superform:install"
    end

    def insatll_ruby_ui
      if !@engine || (@engine && @override)
        say "install rubyui"
        generate "ruby_ui:install"
        generate "ruby_ui:component:all"
      end
    end

    def install_tw_animate_css # because this file is usually missing while installing ruby_ui
      template "tw-animate-css.js.tt", File.join(destination_root, "vendor/javascript/tw-animate-css.js") unless @engine
    end

    def create_initializer
      say "install swage"
      template "swage.rb.tt", File.join(destination_root, "config/initializers/swage.rb"), force: true
    end

    def create_base_component
      template "base_component.rb.tt", File.join(destination_root, "app/components/base.rb"), force: true if @override
    end

    def create_base_view
      template "base_view.rb.tt", File.join(destination_root, "app/views/base.rb"), force: true if @override
    end

    def create_base_form
      template "form.rb.tt", File.join(destination_root, "app/components/form.rb"), force: true if @override
    end

    def modify_application_controller
      template "application_controller.rb.tt", File.join(destination_root, "app/controllers/application_controller.rb") if @override
    end

    def modify_engine
      return unless @engine
      @name ||= get_name
      template "engine.rb.tt", File.join(destination_root, "lib", get_name, "engine.rb")
    end

    def fix_initializer # require phlexible to make sure it's loaded before modifying the function
      return unless @engine
      insert_into_file "config/initializers/swage.rb", "\n\nrequire \"phlexible\"", after: "# frozen_string_literal: true"
    end

    private # copied from ruby_ui installer since that's what it uses
    def using_importmap?
      File.exist?(Rails.root.join("config/importmap.rb")) && File.exist?(Rails.root.join("bin/importmap"))
    end

    def using_bun?
      File.exist?(Rails.root.join("bun.lock"))
    end

    def using_npm?
      File.exist?(Rails.root.join("package-lock.json"))
    end

    def using_pnpm?
      File.exist?(Rails.root.join("pnpm-lock.yaml"))
    end

    def using_yarn?
      File.exist?(Rails.root.join("yarn.lock"))
    end

    def probably_engine?
      @name = get_name

      Dir.glob(File.join(destination_root, "test", "dummy")).empty? ||
      Dir.glob(File.join(destination_root, "*.gemspec")).empty? ||
      File.exist?(File.join(destination_root, "lib", @name, "engine.rb")) ||
      File.exist?(File.join(destination_root, "lib", @name, "railtie.rb"))
    end

    def get_name
      destination_root.match(/\w+$/)[0] # this is gross but there seems to be no better way
    end
  end
end
