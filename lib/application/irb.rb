module Application
  class Irb < Base
    def install
      FileUtils.chdir(base_directory) do
        add_irbrc
      end
    end

    private

    def add_irbrc
      source = File.expand_path(File.join(base_directory, '.irbrc'))
      target = File.expand_path(File.join(home_directory, '.irbrc'))
      Link.new(source, target).create
    end
  end
end
