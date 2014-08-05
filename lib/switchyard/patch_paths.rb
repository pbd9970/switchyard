module Switchyard
  module Redirect
    class << self

      def eigen_config(config)
        ::Rails::Application::Configuration.class_eval do
          class << config
            def paths
              root_obj = super
              ::Switchyard::Redirect.reconfig(root_obj)
            end
          end
        end
      end
    end
  end
end
