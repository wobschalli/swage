module Views
  module Users
    class New < Views::Base
      include Phlexible::Rails::AutoLayout

      def initialize(user: nil)
        @user = user
      end

      controller_variable :user

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          Heading(level: 1) { "New user" }

          render Form.new(@user)

          Link(href: helpers.users_path) { "Back to users" }
        end
      end
    end
  end
end
