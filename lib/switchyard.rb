require_relative 'switchyard/version.rb'
require_relative 'switchyard/errors.rb'
#require_relative 'switchyard/configuration.rb'
#require_relative 'switchyard/configure.rb'
#require_relative 'switchyard/generate_defaults.rb'
require_relative 'switchyard/patch_paths.rb'
require_relative 'switchyard/redirect.rb'

module Switchyard
  class << self
    def run
      rescue UnknownProject => e
        $stderr.puts e.message
        exit 1
    end
  end
end
