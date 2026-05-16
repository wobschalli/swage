module Views
  module Users
    class Form < Components::Form
      def view_template
        FormField do
          FormFieldLabel { "name" }
          Field(:name).input(type: :text_field)
        end
        FormField do
          FormFieldLabel { "email" }
          Field(:email).input(type: :text_field)
        end
        FormField do
          FormFieldLabel { "Password" }
          Field(:password).password
        end
        FormField do
          FormFieldLabel { "Password Confirmation" }
          Field(:password_confirmation).password
        end
        div(class: "inline") do
          submit
        end
      end
    end
  end
end
