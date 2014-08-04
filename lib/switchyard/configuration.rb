require 'yaml'

module Switchyard
  class Configuration
    
    def initialize
      begin
        @config_file = project_root + 'config/switchyard.yml'
      rescue Errno::ENOENT
        write_config_file(GenerateDefaults.new)
      end
      
      set_config_from_file(@config_file)
    end

    def write_config_file(default_config)
      YAML.dump(default_config)
    end

    def set_config_from_file(config_file)
      YAML.load_file('some.yml')
    end
  end
end
