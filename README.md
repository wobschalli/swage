# Swage
Basically a different implementation of [Superview](https://github.com/rubymonolith/superview), but with a few extra goodies and generators baked in. Use [Phlex](https://github.com/yippee-fun/phlex-rails/) for rendering views and [Superform](https://github.com/rubymonolith/superform/) for the form DSL and strong parameters. Uses [RubyUI](https://github.com/ruby-ui/ruby_ui) for the base UI components and [Phlexible](https://github.com/joelmoss/phlexible) to glue everything together (along with a lot of monkeypatching).

## Installation
Simply run `rails g swage:install`, and all of the necessary components will be generated. Please not this might take a while to run.

## Usage
By default Swage will hook into the rails scaffold engine. However, it is a drop-in replacement for the erb scaffold_controller, meaning it can be used in the exact same way.

## Modification
If you wish to modify the generators, use `rails g swage:generators` to generate all of the scaffold and install generators/templates.


## TODO
* Actually make it into a gem by adding the proper files and removing the unnecessary ones
    * Remove unnecessary gems
* Consolidate the Tailwind classes down for the non-RubyUI components
