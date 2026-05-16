module Views
  module Users
    class Show < Views::Base
      include Phlexible::Rails::AutoLayout

      def initialize(user: nil)
        @user = user
      end

      controller_variable :user

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          if helpers.notice.present?
            Text(id: "notice") { helpers.notice }
          end

          render Partial.new(user: @user)

          div(class: "mt-8 flex gap-4 border-t pt-6") do
            Link(href: edit_user_path(@user)) { "Edit this user" }
            Link(href: users_path) { "Back to users" }

            render Phlexible::Rails::ButtonTo.new(
              user_path(@user),
              method: :delete,
              form_attributes: { class: "inline" },
              variant: :destructive
            ) { "Destroy" }
          end
        end
      end
    end
  end
end
