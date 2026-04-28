Rails.application.config.generators do |g|
  g.template_engine :phlex

  g.fallbacks[:phlex] = :erb
end

if Rails.env.development? || Rails.env.test?
  path = Rails.root.join("lib/generators/phlex/scaffold/scaffold_generator.rb")
  require path if File.exist?(path)
end
