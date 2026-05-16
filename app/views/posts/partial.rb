module Views
  module Posts
    class Partial < Views::Base
      include Phlex::Rails::Helpers::DOMID

      def initialize(post: nil)
        @post = post
      end

      def view_template
        div(id: dom_id(@post), class: "py-6 flex justify-between items-center") do
          div do
            div(class: "mb-2") do
              strong(class: "block text-xs uppercase tracking-wide text-gray-500") { "Name" }
              p(class: "text-lg") { @post.name.to_s }
            end
            div(class: "mb-2") do
              strong(class: "block text-xs uppercase tracking-wide text-gray-500") { "Body" }
              p(class: "text-lg") { @post.body.to_s }
            end
            div(class: "mb-2") do
              strong(class: "block text-xs uppercase tracking-wide text-gray-500") { "Author" }
              p(class: "text-lg") { @post.author.to_s }
            end
          end

          div(class: "flex gap-4") do
            a(href: post_path(@post), class: "text-blue-600 hover:text-blue-800 font-medium") { "View" }
            a(href: edit_post_path(@post), class: "text-gray-600 hover:text-gray-800 font-medium") { "Edit" }
          end
        end
      end
    end
  end
end
