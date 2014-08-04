
module Switchyard
  class Switchyard
    def self.redirect(rails)

      switchyard = rails.application.instance_variable_get('@config')
      switchyard.root = switchyard.root + 'rails'
    end
  end
end
