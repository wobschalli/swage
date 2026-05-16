# frozen_string_literal: true

module Swage::Generators
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    deps = %w[ phlex-rails phlexible superform ruby_ui ]

    deps.each do |d|
      say "checking for dependency #{d} in the gemfile"
      if gem_in_bundle?(d)
        say "found!"
        deps.delete d
      else
        say "missing #{d} in gemfile"
      end
    end

    if yes?("Would you like to install the missing dependencies automatically?")
      add_source "https://rubygems.org" do
        deps.each do |d|
          gem d, group: d == "ruby_ui" ? :development : %i[ development, testing, production ]
        end
      end
    else
      exit 1
    end

    say "install phlex"
    generate "phlex:install"

    say "install superform"
    generate "superform:install"

    say "install rubyui"
    generate "ruby_ui:install"
    generate "ruby_ui:component:all"

    def create_initializer
      template "swage.rb.tt", File.join(destination_root, "config/initializers/swage.rb")
    end

    def create_base_component
      template "base_component.rb.tt", File.join(destination_root, "app/components/base.rb")
    end

    def create_base_view
      template "base_view.rb.tt", File.join(destination_root, "app/views/base.rb")
    end

    def create_base_form
      template "form.rb.tt", File.join(destination_root, "app/components/form.rb")
    end
  end
end
