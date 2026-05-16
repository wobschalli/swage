module Views
  module Posts
    class New < Views::Base
      include Phlexible::Rails::AutoLayout
      def initialize(post: nil)
        @post = post
      end

      controller_variable :post

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          h1(class: "font-bold text-4xl mb-10") { "New post" }

          render Form.new(@post)

          a(href: posts_path, class: "block mt-6 text-gray-600 hover:underline") { "Back to posts" }
        end
      end
    end
  end
end
