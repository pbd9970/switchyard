
module Switchyard
  module Redirect
    class << self
      def paths
        ::Rails::Application::Configuration.class_eval do
          def paths
            assignment = false
            @paths ||= begin
              paths = super
              paths.add "config/database",    with: "config/database.yml"
              paths.add "config/secrets",     with: "config/secrets.yml"
              paths.add "config/environment", with: "config/environment.rb"
              paths.add "lib/templates"
              paths.add "log",                with: "log/#{Rails.env}.log"
              paths.add "public"
              paths.add "public/javascripts"
              paths.add "public/stylesheets"
              paths.add "tmp"
              
              assignment = true
              paths
            end
            ::Switchyard::Redirect.reconfig(@paths, assignment)
          end
        end
      end
    end
  end
end
