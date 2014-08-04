module Switchyard
  class Configuration
    class GenerateDefaults << self

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
          POINTER_FILES.each do |pointer|
            pwd_path = Pathname.new(File.expand_path(Dir.pwd))
            project_root ||= find_project_root(pwd_path, pointer)
          end


          raise UnknownProject.new(Dir.pwd, POINTER_FILES) unless project_root
          project_root

          rescue UnknownProject => e
            $stderr.puts e.message
            exit 1
        end
      end

      def presentation_layer
        project_root + "presentation"
      end

      def persistence_layer
        project_root + "db"
      end

      def business_logic
        project_root + "lib"
      end

      def rails_paths 
        "app"                      => [presentation_layer,"app"],
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

        "config"                   => "config",
        "config/environments"      => "config/environments",
        "config/initializers"      => "config/initializers",
        "config/locales"           => "config/locales",
        "config/routes.rb"         => "config/routes.rb",

        "db"                       => "db",
        "db/migrate"               => "db/migrate",
        "db/seeds.rb"              => "db/seeds.rb",

        "vendor"                   => "vendor",
        "vendor/assets"            => "vendor/assets",

                 
        "config/database"          => "config/database",
        "config/secrets"           => "config/secrets",
        "config/environment"       => "config/environment",
        "lib/templates"
        "log"                      => "log",
        "public"                   => "public",
        "public/javascripts"       => "public/javascripts",
        "public/stylesheets"       => "public/stylesheets",
      end
    end
  end
end

