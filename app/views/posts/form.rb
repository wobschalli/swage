module Views
  module Posts
    class Form < Components::Form
      def view_template
        FormField do
          FormFieldLabel { "name" }
          Field(:name).input
          FormFieldError { model.errors[:name].map { "Name #{it}" }.join("\n") }
        end

        FormField do
          FormFieldLabel { "body" }
          Field(:body).textarea
          FormFieldError { model.errors[:body].map { "Body #{it}" }.join("\n") }
        end

        FormField do
          FormFieldLabel { "author" }
          Field(:author).input
          FormFieldError { model.errors[:author].map { "Author #{it}" }.join("\n") }
        end

        div(class: "inline") do
          submit
        end
      end
    end
  end
end
