module Views
  module Users
    class Partial < Views::Base
      include Phlex::Rails::Helpers::DOMID

      def initialize(user: nil)
        @user = user
      end

      def view_template
        div(id: helpers.dom_id(@user), class: "py-6 flex justify-between items-center") do
          div do
            div(class: "mb-2") do
              strong(class: "block text-xs uppercase tracking-wide text-gray-500") { "Name" }
              p(class: "text-lg") { @user.name.to_s }
            end
            div(class: "mb-2") do
              strong(class: "block text-xs uppercase tracking-wide text-gray-500") { "Email" }
              p(class: "text-lg") { @user.email.to_s }
            end
          end

          div(class: "flex gap-4") do
            a(href: user_path(@user), class: "text-blue-600 hover:text-blue-800 font-medium") { "View" }
            a(href: edit_user_path(@user), class: "text-gray-600 hover:text-gray-800 font-medium") { "Edit" }
          end
        end
      end
    end
  end
end