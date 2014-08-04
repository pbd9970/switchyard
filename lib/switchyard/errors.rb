module Switchyard
  class UnknownProject < StandardError
    def initialize(pwd_path, pointers)
      @pwd_path = pwd_path
      @pointers = pointers.join(" or ")
    end

    def message
      %Q[Unable to locate the root of your project. There was no
      #{pointers} files/folders anywhere in the current directory
      (#{pwd_path}) or in any of the parent directories.]
    end
  end
end
