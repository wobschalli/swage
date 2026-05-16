module Views
  module Posts
    class Show < Views::Base
      def initialize(post: nil)
        @post = post
      end

      controller_variable :post

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          if helpers.notice.present?
            p(class: "py-2 px-3 bg-green-50 mb-5 text-green-700 font-medium rounded-lg inline-block", id: "notice") { helpers.notice }
          end

          render Partial.new(post: @post)

          div(class: "mt-8 flex gap-4 border-t pt-6") do
            a(href: edit_post_path(@post), class: "rounded-lg py-3 px-5 bg-gray-100 font-medium hover:bg-gray-200 transition") { "Edit this post" }
            a(href: posts_path, class: "rounded-lg py-3 px-5 bg-white border font-medium hover:bg-gray-50 transition") { "Back to posts" }

            Phlexible::Rails::ButtonTo.new(
              post_path(@post),
              method: :delete,
              form_attributes: { class: "inline" },
              class: "rounded-lg py-3 px-5 bg-red-50 text-red-600 font-medium hover:bg-red-100 transition cursor-pointer"
            ) { "Destroy" }
          end
        end
      end
    end
  end
end
