class Views::Layouts::Application < Phlex::HTML
  def initialize(view)
    @view = view
  end

  def view_template(&block)
    doctype

    def view_template
      html do
        head do
          title { content_for(:title) || "Abid" }
          meta(name: "viewport", content: "width=device-width,initial-scale=1")
          meta(name: "apple-mobile-web-app-capable", content: "yes")
          meta(name: "application-name", content: "Abid")
          meta(name: "mobile-web-app-capable", content: "yes")
          whitespace
          csrf_meta_tags
          whitespace
          csp_meta_tag
          whitespace
          # Enable PWA manifest for installable apps (make sure to enable in config/routes.rb too!)
          # whitespace
          # tag.link rel: "manifest", href: pwa_manifest_path(format: :json)
          link(rel: "icon", href: "/icon.png", type: "image/png")
          link(rel: "icon", href: "/icon.svg", type: "image/svg+xml")
          link(rel: "apple-touch-icon", href: "/icon.png")
          whitespace
          # Includes all stylesheet files in app/assets/stylesheets
          stylesheet_link_tag :app, "data-turbo-track": "reload"
          whitespace
          javascript_importmap_tags
        end
        body do
          div(id: "main-layout", &block)
        end
      end
    end
  end
end
