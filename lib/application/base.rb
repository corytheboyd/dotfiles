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

    def clone_repo(name:, url:, verbose: true, &block)
      if File.directory?(name)
        puts " * Updating #{name} from #{url}" if verbose
        FileUtils.chdir(name) do
          `git fetch && git reset --hard origin/master`
        end
      else
        puts " * Cloning #{name} from #{url}" if verbose
        `git clone #{url} #{name}`
      end

      if block_given?
        FileUtils.chdir(name) { block.call(name, url) }
      end
    end
  end
end
