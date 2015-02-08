module Application
  class Vim < Base
    def install
      FileUtils.chdir(base_directory) do
        add_vimrc_before
        add_vimrc_after
      end
    end

    private

    def add_vimrc_before
      source = File.expand_path(File.join(base_directory, '.vimrc.before'))
      target = File.expand_path(File.join(home_directory, '.vimrc.before'))
      Link.new(source, target).create
    end

    def add_vimrc_after
      source = File.expand_path(File.join(base_directory, '.vimrc.after'))
      target = File.expand_path(File.join(home_directory, '.vimrc.after'))
      Link.new(source, target).create
    end
  end
end
