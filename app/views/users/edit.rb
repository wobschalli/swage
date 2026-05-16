module Views
  module Users
    class Edit < Views::Base
      def initialize(user: nil)
        @user = user
      end

      controller_variable :user

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          h1(class: "font-bold text-4xl mb-10") { "Editing user" }

          render Form.new(@user)

          div(class: "mt-6 flex gap-4") do
            a(href: helpers.user_path(@user), class: "text-blue-600 hover:underline") { "Show this user" }
            span(class: "text-gray-300") { "|" }
            a(href: helpers.users_path, class: "text-gray-600 hover:underline") { "Back to users" }
          end
        end
      end
    end
  end
end