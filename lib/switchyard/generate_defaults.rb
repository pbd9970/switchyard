module Switchyard
  class Configure
    class << self
      def layer_class(sym)
        class_eval <<-EOC
          class #{sym}
            def initialize(path)
              @path = #{sym}_layer.join(path)
            end
          end
          EOC
      end
    end

    class GenerateDefaults

      POINTER_FILES = %w(Gemfile .git .hg)

      def find_project_root(pwd_path, pointer_file)
        if pwd_path.join(pointer_file).exist?
          return pwd_path
        elsif pwd_path.root?
          return nil
        else
          find_project_root(pwd_path.parent, pointer_file)
        end
      end

      def project_root
        @project_root ||= begin
          project_root = nil
          POINTER_FILES.each do |pointer|
            pwd_path = Pathname.new(File.expand_path(Dir.pwd))
            project_root ||= find_project_root(pwd_path, pointer)
          end

          raise UnknownProject.new(Dir.pwd, POINTER_FILES) unless project_root
          project_root
        end
      end

      def presentation_layer
        @presentation ||= project_root + "rails"
      end

      def persistence_layer
        @persistence ||= project_root
      end

      def business_logic_layer
        @business_logic ||= project_root + "lib"
      end

      def root_config_layer
        @root_config_layer ||= project_root + "config"
      end

      def app_config_layer
        @app_config_layer ||= presentation_layer + "config"
      end

      def run
        paths = @rails_paths
        paths.each do |layer, paths|
          Layer = layer_class(layer)
          YAML.dump('config/switchyard.rb')
          paths.each do |key, path|
            paths[layer][key] = Layer.new(path)
          end
        end
      end


      def rails_paths 
        # Default rails path configuration
        {
          presentation: {
            "app"                      => "app",
            "app/assets"               => "app/assets",
            "app/controllers"          => "app/controllers",
            "app/helpers"              => "app/helpers",
            "app/models"               => "app/models",
            "app/mailers"              => "app/mailers",
            "app/views"                => "app/views",

            "app/controllers/concerns" => "app/controllers/concerns",
            "app/models/concerns"      => "app/models/concerns",

            "lib"                      => "lib",
            "lib/assets"               => "lib/assets",
            "lib/tasks"                => "lib/tasks",
            "lib/templates"            => "lib/templates",

            "vendor"                   => "vendor",
            "vendor/assets"            => "vendor/assets",
                     
            "log"                      => "log",

            "public"                   => "public",
            "public/javascripts"       => "public/javascripts",
            "public/stylesheets"       => "public/stylesheets"
                     
            "tmp"                      => "tmp",
          },

          persistence: {
            "db"                       => "db",
            "db/migrate"               => "db/migrate",
            "db/seeds.rb"              => "db/seeds.rb",
          },

          root_config: {
            "config/environment"       => "config/environment",
            "config/environments"      => "config/environments",
            "config/database"          => "config/database",
          },

          app_config: {
            "config"                   => "config",
            "config/initializers"      => "config/initializers",
            "config/locales"           => "config/locales",
            "config/routes.rb"         => "config/routes.rb",
            "config/secrets"           => "config/secrets",
          }
        }
      end
    end
  end
end

