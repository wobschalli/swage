# frozen_string_literal: true

class Views::Base < Components::Base
  include Phlexible::Rails::AutoLayout
  include Phlexible::Rails::AElement
  # The `Views::Base` is an abstract class for all your views.

  # By default, it inherits from `Components::Base`, but you
  # can change that to `Phlex::HTML` if you want to keep views and
  # components independent.

  # More caching options at https://www.phlex.fun/components/caching
  def cache_store = Rails.cache

  self.auto_layout_view_prefix = "Views::"
  self.auto_layout_namespace = "Views::Layouts::"
  self.auto_layout_default = "Views::Layouts::Application"
end
