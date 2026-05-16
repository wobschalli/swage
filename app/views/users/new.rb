module Views
  module Users
    class New < Views::Base
      def initialize(user: nil)
        @user = user
      end

      controller_variable :user

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          h1(class: "font-bold text-4xl mb-10") { "New user" }

          render Form.new(@user)

          a(href: helpers.users_path, class: "block mt-6 text-gray-600 hover:underline") { "Back to users" }
        end
      end
    end
  end
end