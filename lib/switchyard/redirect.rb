module Switchyard
  module Redirect
    class << self
      #def paths(rails_config)
      #  #redirect(Switchyard::Configuration)
      #  #Switchyard::Configuration::GenerateDefaults.new
      #  paths = rails_config.paths
      #end

      def reconfig(paths)
        path_hash = paths.instance_variable_get('@root')
        path_hash.each do |path_descriptor, rails_path_obj|
          path_arr = rails_path_obj.instance_variable_get('@paths')
          current_path = rails_path_obj.instance_variable_get('@current')
          return paths if path_descriptor != current_path

          rails_path_obj.instance_variable_set('@current', rails_paths[path_descriptor] + current_path)
          path_arr.map! do |path|
            path = rails_paths[path_descriptor] + path
          end
        end
        paths
      end

      def rails_paths 
        {
            "app"                      => "rails/",
            "app/assets"               => "rails/",
            "app/controllers"          => "rails/",
            "app/helpers"              => "rails/",
            "app/models"               => "rails/",
            "app/mailers"              => "rails/",
            "app/views"                => "rails/",

            "app/controllers/concerns" => "rails/",
            "app/models/concerns"      => "rails/",

            "lib"                      => "rails/",
            "lib/assets"               => "rails/",
            "lib/tasks"                => "rails/",
            "lib/templates"            => "rails/",

            "vendor"                   => "rails/",
            "vendor/assets"            => "rails/",
                     
            "log"                      => "rails/",

            "public"                   => "rails/",
            "public/javascripts"       => "rails/",
            "public/stylesheets"       => "rails/",
                     
            "tmp"                      => "rails/",

            "db"                       => "",
            "db/migrate"               => "",
            "db/seeds.rb"              => "",

            "config/environment"       => "",
            "config/environments"      => "",
            "config/database"          => "",

            "config"                   => "rails/",
            "config/initializers"      => "rails/",
            "config/locales"           => "rails/",
            "config/routes.rb"         => "rails/",
            "config/secrets"           => "rails/"
        }
      end
    end
  end
end
