module Components
  class Form < Superform::Rails::Form
    include Phlexible::Callbacks
    include Phlex::Rails::Helpers::FormAuthenticityToken
    include RubyUI

    # monkeypatch superform here because editing superform itself is gross
    class Field < self::Field
      include RubyUI
      def input(**attributes)
        attributes.merge! dom_hash(field.dom)
        RubyUI::Input.new(**attributes)
      end

      def checkbox(index: nil, **attributes)
        attributes.merge! dom_hash(field.dom)
        RubyUI::Checkbox.new(**attributes)
      end

      def textarea(**attributes)
        attributes.merge! dom_hash(field.dom)
          RubyUI::Textarea.new(**attributes) { attributes[:value] }
      end

      def select(*options, multiple: false, **attributes, &)
        attributes.merge! dom_hash(field.dom)
        if mutliple
          CheckboxGroup do
            options.each do |opt|
              div class: "flex flex-col gap-2" do
                div class: "flex flex-row items-center gap-2" do
                  RubyUI::Checkbox(*attributes, id: "select_#{opt}")
                  FormFieldLabel(for: "select_#{opt}") { opt.capitalize }
                end
              end
            end
          end
        else
          RubyUI::Select(**attributes) do
            SelectGroup do
              options.each do |opt|
                SelectItem(value: opt) { opt.capitalize }
              end
            end
          end
        end
      end

      # def datalist(*options, **attributes, &block)
      #   Components::Datalist.new(field, options:, **attributes, &block)
      # end

      def errors
        object.errors[key]
      end

      def invalid?
        errors.any?
      end

      def valid?
        not invalid?
      end

      def human_attribute_name
        object.class.human_attribute_name key
      end

      def text(**)
        RubyUI::Input(**, type: :text)
      end

      def hidden(**)
        RubyUI::Input(**, type: :hidden)
      end

      def password(**attributes)
        RubyUI::Input(**attributes.merge(dom_hash(field.dom).merge(type: :password)))
        # RubyUI::Input(**, type: :password)
      end

      def email(**)
        RubyUI::Input(**, type: :email)
      end

      def url(**)
        RubyUI::Input(**, type: :url)
      end

      def tel(**)
        RubyUI::Input(**, type: :tel)
      end
      alias_method :phone, :tel

      def number(**)
        RubyUI::Input(**, type: :number)
      end

      def range(**)
        RubyUI::Input(**, type: :range)
      end

      def date(**)
        RubyUI::DatePicker(**)
      end

      def time(**)
        RubyUI::Input(**, type: :time)
      end

      def datetime(**)
        RubyUI::Input(**, type: :"datetime-local")
      end

      def month(**)
        RubyUI::Input(**, type: :month)
      end

      def week(**)
        RubyUI::Input(**, type: :week)
      end

      def color(**)
        RubyUI::Input(**, type: :color)
      end

      def search(**)
        RubyUI::Input(**, type: :search)
      end

      def file(**)
        RubyUI::Input(**, type: :file)
      end

      def radio(value, index: value, **attributes)
        attributes.merge! dom_hash(field.dom)
        div class: "clex items-center space-x-2" do
          RubyUI::RadioButton(id: index)
          FormFieldLabel(for: index) { value }
        end
      end

      def radios(*options, **attributes, &block)
        options = enum_options if options.empty?
        Components::Radios.new(field, options:, **attributes, &block)
      end

      def checkboxes(*options, **attributes, &block)
        options = enum_options if options.empty?
        attributes.merge! dom_hash(field.dom)

        CheckboxGroup do
          options.each do |opt|
            div class: "flex flex-col gap-2" do
              div class: "flex flex-row items-center gap-2" do
                RubyUI::Checkbox(*attributes, id: "select_#{opt}")
                FormFieldLabel(for: "select_#{opt}") { opt.capitalize }
              end
            end
          end
        end
      end

      # Rails compatibility aliases
      alias_method :check_box, :checkbox
      alias_method :text_area, :textarea

      def title
        key.to_s.titleize
      end

      private
      # superform has a field with a dom that stores useful values... must convert it to usable attributes
      def dom_hash(dom)
        {
          id: dom.id,
          name: dom.name,
          value: dom.value
        }
      end
    end

    def around_template(&)
      super do
        yield if block_given?
      end
    end

    def submit(value = submit_value, **attributes)
      div do
        RubyUI::Button(name: "commit", type: "submit", **attributes) { submit_value }
      end
    end
  end
end
