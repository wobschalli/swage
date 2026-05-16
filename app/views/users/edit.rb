module Views
  module Users
    class Edit < Views::Base
      include Phlexible::Rails::AutoLayout

      def initialize(user: nil)
        @user = user
      end

      controller_variable :user

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          Heading(level: 1) { "Editing user" }

          render Form.new(@user)

          div(class: "mt-6 flex gap-4") do
            Link(href: helpers.user_path(@user)) { "Show this user" }
            span(class: "text-gray-300") { "|" }
            Link(href: helpers.users_path) { "Back to users" }
          end
        end
      end
    end
  end
end
