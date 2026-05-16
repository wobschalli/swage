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
              Text(as: "strong", size: "4", wight: "bold") { "Name" }
              Text(size: "4", weight: "semibold") { @user.name.to_s }
            end
            div(class: "mb-2") do
              Text(as: "strong", size: "4", wight: "bold") { "Email" }
              Text(size: "4", weight: "semibold") { @user.email.to_s }
            end
          end
        end
      end
    end
  end
end
