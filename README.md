# Swage
:0

A gem gluing together [Phlex](https://github.com/yippee-fun/phlex-rails/), [RubyUI](https://github.com/ruby-ui/ruby_ui), and [Superform](https://github.com/rubymonolith/superform/) via [Phlexible](https://github.com/joelmoss/phlexible) and a lot of monkeypatching.


## TODO
* Find a way to copy a bunch of the necessary files, such as `app/controllers/application_controller.rb` or `app/views/base.rb` so that they don't get overridden when installing Superform or RubyUI
* Actually make it into a gem by adding the proper files and removing the unnecessary ones
    * Also adding an install script would be really good
    * Remove unnecessary gems
* Consolidate the Tailwind classes down for the non-RubyUI components
