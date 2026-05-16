module Views
  module Users
    class Form < Components::Form
      def view_template
        FormField do
          FormFieldLabel { "name" }
          Field(:name).input(type: :text_field)
          FormFieldError { model.errors[:name].map { "Name #{it}" }.join("\n") }
        end
        FormField do
          FormFieldLabel { "email" }
          Field(:email).input(type: :text_field)
          FormFieldError { model.errors[:email].map { "Email #{it}" }.join("\n") }
        end
        FormField do
          FormFieldLabel { "Password" }
          Field(:password).password
          FormFieldError { model.errors[:password].map { "Password #{it}" }.join("\n") }
        end
        FormField do
          FormFieldLabel { "Password Confirmation" }
          Field(:password_confirmation).password
          FormFieldError { model.errors[:password_confirmation].map { "Password #{it}" }.join("\n") }
        end
        div(class: "inline") do
          submit
        end
      end
    end
  end
end
