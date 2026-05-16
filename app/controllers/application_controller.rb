class ApplicationController < ActionController::Base
  include Superform::Rails::StrongParameters
  include Phlexible::Rails::ActionController::ImplicitRender
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # set up path for implicit rendering
  def phlex_view_path(action_name)
    "views/#{controller_path}/#{action_name}"
  end
end
