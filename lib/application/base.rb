require './lib/link'

module Application
  class Base
    attr_reader :base_directory

    def initialize(base_directory)
      @base_directory = base_directory
    end

    def install
      raise NotImplementedError
    end

    def home_directory
      ENV['HOME']
    end
  end
end
