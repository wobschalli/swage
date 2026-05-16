# frozen_string_literal: true

class Views::Base < Phlex::HTML
  include Phlexible::Rails::AutoLayout # automatically render the layouts
  include Phlexible::Rails::AElement # don't use link_to but instead native anchor tags
  include Phlexible::Rails::ControllerVariables # automatically include the controller variables in the view
  include Phlexible::Callbacks # don't call super in every method
  include RubyUI
  include Rails.application.routes.url_helpers
  # The `Views::Base` is an abstract class for all your views.

  # By default, it inherits from `Components::Base`, but you
  # can change that to `Phlex::HTML` if you want to keep views and
  # components independent.

  # More caching options at https://www.phlex.fun/components/caching
  def cache_store = Rails.cache

  # set up layout paths
  self.auto_layout_view_prefix = "Views::"
  self.auto_layout_namespace = "Views::Layouts::"
  self.auto_layout_default = "Views::Layouts::Application"
end
