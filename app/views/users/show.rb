module Views
  module Users
    class Show < Views::Base
      def initialize(user: nil)
        @user = user
      end

      controller_variable :user

      def view_template
        div(class: "mx-auto md:w-2/3 w-full px-8") do
          if helpers.notice.present?
            p(class: "py-2 px-3 bg-green-50 mb-5 text-green-700 font-medium rounded-lg inline-block", id: "notice") { helpers.notice }
          end

          render Partial.new(user: @user)

          div(class: "mt-8 flex gap-4 border-t pt-6") do
            a(href: edit_user_path(@user), class: "rounded-lg py-3 px-5 bg-gray-100 font-medium hover:bg-gray-200 transition") { "Edit this user" }
            a(href: users_path, class: "rounded-lg py-3 px-5 bg-white border font-medium hover:bg-gray-50 transition") { "Back to users" }
            
            Phlexible::Rails::ButtonTo.new(
              user_path(@user),
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