module Switchyard
  class << self
    def identify_current_structure
    end
  end
end

#"app",                 eager_load: true, glob: "*"
#"app/assets",          glob: "*"
#"app/controllers",     eager_load: true
#"app/helpers",         eager_load: true
#"app/models",          eager_load: true
#"app/mailers",         eager_load: true
#"app/views"

#"app/controllers/concerns", eager_load: true
#"app/models/concerns",      eager_load: true

#"lib",                 load_path: true
#"lib/assets",          glob: "*"
#"lib/tasks",           glob: "**/*.rake"

#"config"
#"config/environments", glob: "#{Rails.env}.rb"
#"config/initializers", glob: "**/*.rb"
#"config/locales",      glob: "*.{rb,yml}"
#"config/routes.rb"

#"db"
#"db/migrate"
#"db/seeds.rb"

#"vendor",              load_path: true
#"vendor/assets",       glob: "*"

#         
#"config/database",    with: "config/database.yml"
#"config/secrets",     with: "config/secrets.yml"
#"config/environment", with: "config/environment.rb"
#"lib/templates"
#"log",                with: "log/#{Rails.env}.log"
#"public"
#"public/javascripts"
#"public/stylesheets"
