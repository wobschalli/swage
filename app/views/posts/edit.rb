module Views
  module Posts
    class Edit < Views::Base
      def initialize(post: nil)
        @post = post
      end

      controller_variable :post

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          h1(class: "font-bold text-4xl mb-10") { "Editing post" }

          render Form.new(@post)

          div(class: "mt-6 flex gap-4") do
            a(href: post_path(@post), class: "text-blue-600 hover:underline") { "Show this post" }
            span(class: "text-gray-300") { "|" }
            a(href: posts_path, class: "text-gray-600 hover:underline") { "Back to posts" }
          end
        end
      end
    end
  end
end
