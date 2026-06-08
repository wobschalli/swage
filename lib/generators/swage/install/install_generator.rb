# frozen_string_literal: true

module Swage::Generators
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def check_for_js
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
        say "checking for dependency #{d} in the gemfile"
        if Gem.loaded_specs.has_key?(d)
          say "found!"
        else
          say "missing #{d} in gemfile"
          missing << d
        end
      end

      if missing.any?
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
      say "install tailwind"
      execute_command "rake", "tailwindcss:install"
    end

    def install_phlex
      say "install phlex"
      generate "phlex:install"
    end

    def install_superform
      say "install superform"
      generate "superform:install"
    end

    def insatll_ruby_ui
      say "install rubyui"
      generate "ruby_ui:install"
      generate "ruby_ui:component:all"
    end

    def install_tw_animate_css # because this file is usually missing while installing ruby_ui
      template "tw-animate-css.js.tt", File.join(destination_root, "vendor/javascript/tw-animate-css.js")
    end

    def create_initializer
      say "install swage"
      template "swage.rb.tt", File.join(destination_root, "config/initializers/swage.rb"), force: true
    end

    def create_base_component
      template "base_component.rb.tt", File.join(destination_root, "app/components/base.rb"), force: true
    end

    def create_base_view
      template "base_view.rb.tt", File.join(destination_root, "app/views/base.rb"), force: true
    end

    def create_base_form
      template "form.rb.tt", File.join(destination_root, "app/components/form.rb"), force: true
    end

    def modify_application_controller
      template "application_controller.rb.tt", File.join(destination_root, "app/controllers/application_controller.rb")
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
  end
end
