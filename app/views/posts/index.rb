module Views
  module Posts
    class Index < Views::Base
      include Phlexible::Rails::AutoLayout
      def initialize(posts: nil)
        @posts = posts
      end

      controller_variable :posts

      def view_template
        div(class: "w-full px-8") do
          if helpers.notice.present?
            p(class: "py-2 px-3 bg-green-50 mb-5 text-green-700 font-medium rounded-lg inline-block", id: "notice") { helpers.notice }
          end

          div(class: "flex justify-between items-center mb-10") do
            h1(class: "font-bold text-4xl") { "Posts" }
            a(href: new_post_path,
              class: "rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium hover:bg-blue-700 transition"
            ) { "New post" }
          end

          div(id: "posts", class: "min-w-full divide-y divide-gray-200") do
            @posts.each do |post|
              render Partial.new(post: post)
            end
          end
        end
      end
    end
  end
end
