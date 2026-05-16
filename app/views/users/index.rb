module Views
  module Users
    class Index < Views::Base
      include Phlexible::Rails::AutoLayout

      def initialize(users: nil)
        @users = users
      end

      controller_variable :users

      def view_template
        div(class: "w-full px-8") do
          if helpers.notice.present?
            Text(id: "notice") { helpers.notice }
          end

          div(class: "flex justify-between items-center mb-10") do
            Heading(level: 1) { "Users" }
            Link(href: new_user_path) { "New user" }
          end

          div(id: "users", class: "min-w-full divide-y divide-gray-200") do
            @users.each do |user|
              div do
                render Partial.new(user: user)
                div(class: "flex gap-4") do
                  Link(href: user_path(user)) { "View" }
                  Link(href: edit_user_path(user)) { "Edit" }
                end
              end
            end
          end
        end
      end
    end
  end
end
