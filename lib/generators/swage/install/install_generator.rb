# frozen_string_literal: true

module Swage::Generators
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

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
              gem d, group: d == "ruby_ui" ? :development : %i[ development, testing, production ]
            end
          end
        else
          exit 1
        end
      end

      say "install tailwind"
      execute_command "rake", "tailwindcss:install"

      say "install phlex"
      generate "phlex:install"

      say "install superform"
      generate "superform:install"

      say "install rubyui"
      generate "ruby_ui:install"
      generate "ruby_ui:component:all"

      say "install swage"
    end

    def create_initializer
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
  end
end
