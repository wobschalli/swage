module Views
  module Posts
    class Form < Components::Form
      def view_template
        FormField do
          FormFieldLabel { "name" }
          Field(:name).input
        end

        FormField do
          FormFieldLabel { "body" }
          Field(:body).textarea
        end

        FormField do
          FormFieldLabel { "author" }
          Field(:author).input
        end

        div(class: "inline") do
          submit
        end
      end
    end
  end
end
