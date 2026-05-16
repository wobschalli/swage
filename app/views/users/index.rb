module Views
  module Users
    class Index < Views::Base
      def initialize(users: nil)
        @users = users
      end

      controller_variable :users

      def view_template
        div(class: "w-full px-8") do
          if helpers.notice.present?
            p(class: "py-2 px-3 bg-green-50 mb-5 text-green-700 font-medium rounded-lg inline-block", id: "notice") { helpers.notice }
          end

          div(class: "flex justify-between items-center mb-10") do
            h1(class: "font-bold text-4xl") { "Users" }
            a(href: new_user_path,
              class: "rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium hover:bg-blue-700 transition"
            ) { "New user" }
          end

          div(id: "users", class: "min-w-full divide-y divide-gray-200") do
            @users.each do |user|
              render Partial.new(user: user)
            end
          end
        end
      end
    end
  end
end