module Switchyard
  module Redirect
    class << self
      def paths(rails)
        @rails = rails
        redirect(Switchyard::Configuration)
      end

      def redirect(
  end
end
